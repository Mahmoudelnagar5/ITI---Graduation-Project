import '../../../../../../core/routing/route_export.dart';
import '../../data/models/message_model.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: message.isUser
              ? const Color(0xff444746).withOpacity(0.5)
              : const Color.fromARGB(255, 101, 99, 99).withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: message.isUser
                ? const Radius.circular(15)
                : Radius.zero,
            bottomRight: message.isUser
                ? Radius.zero
                : const Radius.circular(15),
          ),
        ),
        child: Text(
          message.text,
          softWrap: true,
          style: AppTextStyles.textStyleRegular14.copyWith(
            fontFamily: AppFontFamily.inter,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: message.isUser ? TextAlign.right : TextAlign.left,
        ),
      ),
    );
  }
}
