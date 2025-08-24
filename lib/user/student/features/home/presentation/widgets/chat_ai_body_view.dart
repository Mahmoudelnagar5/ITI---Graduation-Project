import '../../../../../../core/routing/route_export.dart';
import '../manager/chat_ai/chat_ai_cubit.dart';
import 'messages_list_view.dart';
import 'no_message_widget.dart';

class ChatAIBodyView extends StatefulWidget {
  const ChatAIBodyView({super.key});

  @override
  State<ChatAIBodyView> createState() => _ChatAIBodyViewState();
}

class _ChatAIBodyViewState extends State<ChatAIBodyView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 400),
        curve: Curves.slowMiddle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatAiCubit, ChatAiState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: state.messages.isEmpty
                    ? const NoMessagesWidget()
                    : MessagesListView(
                        scrollController: _scrollController,
                        isLoading: state is ChatAiLoading,
                        messages: state.messages,
                      ),
              ),
              _buildInputField(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7),
      child: Form(
        key: _formKey,
        child: AppTextFormField(
          hintText: 'Type a message...',
          controller: _controller,
          onSaved: (_) {
            if (_formKey.currentState!.validate()) {
              ChatAiCubit.of(context).sendMessage(_controller.text);
              _controller.clear();
              _scrollToEnd();
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a message';
            }
            return null;
          },
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ChatAiCubit.of(context).sendMessage(_controller.text);
                _controller.clear();
                _scrollToEnd();
              }
            },
          ),
        ),
      ),
    );
  }
}
