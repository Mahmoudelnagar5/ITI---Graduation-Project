import 'package:final_project_iti/core/routing/route_export.dart';

class SendNotificationView extends StatefulWidget {
  const SendNotificationView({super.key});

  @override
  State<SendNotificationView> createState() => _SendNotificationViewState();
}

class _SendNotificationViewState extends State<SendNotificationView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  late FcmSender _fcmSender;
  bool _isLoading = true; // Add loading state

  @override
  void initState() {
    super.initState();
    _fcmSender = FcmSender(
      'assets/service_account.json',
      'iti-graduation-project-3f641',
    );
    _initializeFcmSender(); // Call async initialization
  }

  Future<void> _initializeFcmSender() async {
    try {
      await _fcmSender.init();
      debugPrint('FcmSender initialized successfully.');
    } catch (e) {
      debugPrint('Error initializing FcmSender: $e');
      // Handle error, maybe show a snackbar or disable functionality permanently
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    _fcmSender.close(); // Close the FcmSender client
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Send Notification"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notification Details",
              style: AppTextStyles.textStyleMedium18.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Gap(16.h),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter notification title',
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            Gap(16.h),
            TextField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter notification message',
                labelText: 'Message',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            Gap(24.h),
            Center(
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                        debugPrint(
                          'Send Notification button pressed on new page.',
                        );
                        if (_titleController.text.isEmpty ||
                            _messageController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter both title and message',
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            ),
                          );
                          debugPrint('Title or message is empty.');
                          return;
                        }
                        try {
                          debugPrint(
                            'Attempting to send notification from new page...',
                          );
                          final success = await _fcmSender
                              .sendNotificationToTopic(
                                topic: 'allusers',
                                title: _titleController.text,
                                body: _messageController.text,
                              );

                          if (success) {
                            debugPrint(
                              'Notification sent successfully from new page.',
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Notification sent successfully!',
                                ),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pop(context); // Go back after sending
                          } else {
                            debugPrint(
                              'Failed to send notification from new page.',
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to send notification.'),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } catch (e) {
                          debugPrint(
                            'Error sending notification from new page: $e',
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'An error occurred while sending notification.',
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 15.h,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'Send Notification',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
