import 'package:final_project_iti/user/super_admin/features/add_resource/data/add_resource_repo.dart';
import 'package:final_project_iti/user/super_admin/features/add_resource/data/models/resource_model.dart';
import 'package:final_project_iti/user/super_admin/features/add_resource/presentation/widgets/add_resource_app_bar.dart';
import 'package:final_project_iti/user/super_admin/features/add_resource/presentation/views/send_notification_view.dart'; // Import the new view
import 'package:final_project_iti/user/super_admin/features/add_resource/presentation/widgets/resource_title_and_description_section.dart';
import 'package:final_project_iti/core/routing/route_export.dart';

class AddResourceView extends StatefulWidget {
  final AddResourceRepo _repo = AddResourceRepo();

  AddResourceView({super.key});

  @override
  State<AddResourceView> createState() => _AddResourceViewState();
}

class _AddResourceViewState extends State<AddResourceView> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();
  final TextEditingController _linkCtrl = TextEditingController();

  String? _selectedType;
  String? _selectedTrack;

  final List<String> _resourceTypes = ["Article (Link)", "YouTube Video"];

  final List<String> _tracks = [
    'All',
    'Flutter',
    'AI',
    'DevOps',
    'Web Dev',
    'Security',
    'Network',
    'Data Science',
    'Game Dev',
    'UI/UX',
  ];

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _linkCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AddResourceAppBar(title: title),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title + Description
              ResourceTitleAndDescriptionSection(
                titleController: _titleCtrl,
                descriptionController: _descCtrl,
              ),

              Gap(24.h),

              /// Resource Type Dropdown
              const Text(
                "Resource Type",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Gap(8.h),
              DropdownButtonFormField<String>(
                value: _selectedType,
                items: _resourceTypes.map((type) {
                  return DropdownMenuItem(value: type, child: Text(type));
                }).toList(),
                onChanged: (String? newValue) async {
                  setState(() {
                    _selectedType = newValue!;
                    _linkCtrl.clear();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Select type",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                ),
              ),

              Gap(20.h),

              /// Track Dropdown
              const Text(
                "Select Track",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Gap(8.h),
              DropdownButtonFormField<String>(
                value: _selectedTrack,
                items: _tracks.map((track) {
                  return DropdownMenuItem(value: track, child: Text(track));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTrack = newValue;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Choose track",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                ),
              ),

              Gap(20.h),

              /// Extra fields based on type
              if (_selectedType == "Article (Link)" ||
                  _selectedType == "YouTube Video") ...[
                TextField(
                  controller: _linkCtrl,
                  decoration: InputDecoration(
                    labelText: _selectedType == "Article (Link)"
                        ? "Enter article link"
                        : "Enter YouTube link",
                    border: const OutlineInputBorder(),
                  ),
                ),
                Gap(20.h),
              ],

              /// Save Button
              SendNotificationButton(
                label: 'Save Changes',
                onPressed: () async {
                  if (_titleCtrl.text.isEmpty || _selectedType == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter title and select type'),
                      ),
                    );
                    return;
                  }

                  final resource = ResourceModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: _titleCtrl.text.trim(),
                    description: _descCtrl.text.trim(),
                    type: _selectedType!,
                    url: _linkCtrl.text.trim(),
                    track: _selectedTrack,
                    createdAt: DateTime.now(),
                  );

                  try {
                    await widget._repo.addResource(resource);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Resource added successfully!'),
                      ),
                    );

                    _titleCtrl.clear();
                    _descCtrl.clear();
                    _linkCtrl.clear();
                    setState(() {
                      _selectedType = null;
                      _selectedTrack = null;
                    });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SendNotificationView(),
                      ),
                    );
                  } catch (e) {
                    debugPrint('Error adding resource: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to add resource')),
                    );
                  }
                },
              ),

              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
