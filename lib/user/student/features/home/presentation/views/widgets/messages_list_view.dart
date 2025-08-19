import '../../../../../../../core/routing/route_export.dart';
import '../../../data/models/message_model.dart';
import 'message_item.dart';

class MessagesListView extends StatefulWidget {
  const MessagesListView({
    super.key,
    required this.messages,
    required this.isLoading,
    required this.scrollController, // Add ScrollController
  });

  final List<MessageModel> messages;
  final bool isLoading;
  final ScrollController scrollController;
  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        seconds: 2,
      ), // Duration of the rotation animation
      vsync: this,
    )..repeat(); // Repeats the animation infinitely
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController, // Attach ScrollController
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.messages.length + (widget.isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == widget.messages.length && widget.isLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
            child: _buildSkeleton(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
          child: MessageItem(message: widget.messages[index]),
        );
      },
    );
  }

  Widget _buildSkeleton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.mainColorStart.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAnimatedDot(0),
                Gap(4.w),
                _buildAnimatedDot(1),
                Gap(4.w),
                _buildAnimatedDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedDot(int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final delay = index * 0.2;
        final animationValue = (controller.value + delay) % 1.0;
        final opacity = (animationValue * 2).clamp(0.0, 1.0);

        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.mainColorStart.withOpacity(opacity),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}
