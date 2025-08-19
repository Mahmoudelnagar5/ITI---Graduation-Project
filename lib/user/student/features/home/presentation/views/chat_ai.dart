import '../../../../../../core/routing/route_export.dart';
import '../manager/chat_ai/chat_ai_cubit.dart';
import 'widgets/chat_ai_body_view.dart';

class ChatAIView extends StatefulWidget {
  const ChatAIView({super.key});

  @override
  ChatAIViewState createState() => ChatAIViewState();
}

class ChatAIViewState extends State<ChatAIView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatAiCubit(),
      child: BlocConsumer<ChatAiCubit, ChatAiState>(
        listener: (context, state) {
          if (state is ChatAiError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.error)),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              surfaceTintColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'AI Chat',
                style: AppTextStyles.textStyleMedium18.copyWith(
                  fontFamily: AppFontFamily.inter,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    ChatAiCubit.of(context).clearChat();
                  },
                  icon: Icon(
                    Icons.clear_all,

                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            body: const ChatAIBodyView(),
          );
        },
      ),
    );
  }
}
