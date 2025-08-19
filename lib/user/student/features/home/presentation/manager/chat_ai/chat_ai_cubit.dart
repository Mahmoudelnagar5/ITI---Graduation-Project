import 'package:equatable/equatable.dart';
import '../../../../../../../core/routing/route_export.dart';
import '../../../../../../../core/helper/services/gemini_service.dart';
import '../../../data/models/message_model.dart';

part 'chat_ai_state.dart';

class ChatAiCubit extends Cubit<ChatAiState> {
  ChatAiCubit() : super(const ChatAiInitial());

  static ChatAiCubit of(context) => BlocProvider.of(context);

  Future<void> sendMessage(String message) async {
    try {
      // Add user message to current messages
      final currentMessages = state.messages;
      final userMessage = MessageModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: message,
        isUser: true,
        timestamp: DateTime.now(),
      );

      final updatedMessages = [...currentMessages, userMessage];
      emit(ChatAiLoading(messages: updatedMessages));

      //  general ITI information
      final itiGeneralInfo = [
        {
          'institution': 'Information Technology Institute (ITI)',
          'type': 'Government Technology Training Institute',
          'location': 'Smart Village, Giza, Egypt',
          'established': '1993',
          'mission':
              'Provide high-quality technology training and education to develop skilled IT professionals',
          'programs':
              'Professional training programs, specialized tracks, and technology courses',
          'specializations': [
            'Software Development',
            'Web Development',
            'Mobile Development',
            'Artificial Intelligence',
            'Data Science',
            'Cybersecurity',
            'Cloud Computing',
            'DevOps',
            'UI/UX Design',
            'Digital Marketing',
          ],
          'duration': '9-month intensive training programs',
          'certification': 'Government-recognized certificates upon completion',
          'admission':
              'Competitive selection process based on technical assessment',
          'facilities':
              'Modern labs, industry-standard tools, and professional environment',
          'partners':
              'Partnerships with major tech companies and organizations',
          'alumni': 'Thousands of graduates working in leading tech companies',
        },
      ];

      final response = await GeminiService.sendQuery(
        data: itiGeneralInfo,
        userQuery: message,
        systemContext:
            'You are an AI assistant for the Information Technology Institute (ITI) in Egypt. You have comprehensive knowledge about ITI as an institution, its programs, tracks, facilities, and general information. Help users with questions about ITI, its training programs, admission process, specializations, and any other ITI-related inquiries.',
        responseFormat:
            'Provide helpful, informative responses about ITI. Be friendly and professional. If asked about specific tracks or programs, reference the available data. If asked about general ITI information, use the institutional data provided.',
      );

      if (response != null) {
        debugPrint('response: $response');
        // Add AI response to messages
        final aiMessage = MessageModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: response,
          isUser: false,
          timestamp: DateTime.now(),
        );

        final finalMessages = [...updatedMessages, aiMessage];
        emit(ChatAiSuccess(messages: finalMessages));
      } else {
        emit(
          ChatAiError(
            'Failed to get response from AI',
            messages: updatedMessages,
          ),
        );
      }
    } catch (e) {
      debugPrint('error: $e');
      emit(ChatAiError(e.toString(), messages: state.messages));
    }
  }

  void clearError() {
    emit(ChatAiInitial(messages: state.messages));
  }

  void clearChat() {
    emit(const ChatAiInitial());
  }
}
