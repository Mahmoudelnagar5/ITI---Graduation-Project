import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  static final Gemini _gemini = Gemini.init(
    apiKey: dotenv.env['GEMINI_API_KEY'] ?? '',
  );

  static Future<String?> sendQuery({
    required List<Map<String, dynamic>> data,
    required String userQuery,
    String? systemContext,
    String? responseFormat,
  }) async {
    try {
      final prompt = _buildSystemPrompt(
        items: data,
        contextDescription: systemContext,
        responseInstructions: responseFormat,
      );

      final response = await _gemini.prompt(
        parts: [Part.text(prompt), Part.text(userQuery)],
      );
      debugPrint(response?.output);

      return response?.output;
    } catch (e) {
      debugPrint('Gemini Error: ${e.toString()}');
      return null;
    }
  }

  static String _buildSystemPrompt({
    required List<Map<String, dynamic>> items,
    String? contextDescription,
    String? responseInstructions,
  }) {
    final buffer = StringBuffer();

    buffer.write(contextDescription ?? 'Analyze this data:\n');

    for (final item in items) {
      item.forEach((key, value) {
        try {
          if (value is List) {
            for (int i = 0; i < value.length; i++) {
              final itemValue = value[i];
              final safeValue = _safeToString(itemValue);
              buffer.write('• ${key.toUpperCase()}_${i + 1}: $safeValue\n');
            }
          } else {
            final safeValue = _safeToString(value);
            buffer.write('• ${key.toUpperCase()}: $safeValue\n');
          }
        } catch (e) {
          debugPrint('Error formatting item $key: $e');
          buffer.write('• ${key.toUpperCase()}: [Error formatting value]\n');
        }
      });
    }

    buffer.write(responseInstructions ?? '\nRespond helpfully.');
    return buffer.toString();
  }

  static String _safeToString(dynamic value) {
    try {
      if (value == null) return 'null';
      if (value is String) return value;
      if (value is num) return value.toString();
      if (value is bool) return value.toString();
      if (value is List) return '[${value.length} items]';
      if (value is Map) return '[Map with ${value.length} keys]';
      return value.toString();
    } catch (e) {
      return '[Error: $e]';
    }
  }
}
