import 'dart:convert';

import 'ai_provider.dart';

abstract final class AiResponseParser {
  static String extractText(AiProvider provider, dynamic data) {
    if (data is! Map) return '';

    switch (provider) {
      case AiProvider.openRouter:
      case AiProvider.nvidiaNim:
      case AiProvider.openAI:
        return _extractOpenAiText(data);
      case AiProvider.anthropic:
        return _extractAnthropicText(data);
      case AiProvider.google:
        return _extractGoogleText(data);
    }
  }

  static String extractError(int statusCode, String body, dynamic data) {
    if (data is Map) {
      final error = data['error'];
      if (error is Map) {
        final message = error['message'];
        if (message is String && message.isNotEmpty) {
          return 'Błąd API ($statusCode): $message';
        }
        return 'Błąd API ($statusCode): ${jsonEncode(error)}';
      }
      if (error is String && error.isNotEmpty) {
        return 'Błąd API ($statusCode): $error';
      }
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return 'Błąd API ($statusCode): $message';
      }
    }

    final shortBody = body.length > 500 ? '${body.substring(0, 500)}...' : body;
    return 'Błąd API ($statusCode): $shortBody';
  }

  static String _extractOpenAiText(Map data) {
    final choices = data['choices'];
    if (choices is! List || choices.isEmpty) return '';

    final choice = choices.first;
    if (choice is! Map) return '';

    final message = choice['message'];
    if (message is Map) {
      final content = message['content'];
      if (content is String) return content;
      if (content is List) {
        return content
            .whereType<Map>()
            .map((part) => part['text'])
            .whereType<String>()
            .join('\n');
      }
    }

    return choice['text'] is String ? choice['text'] as String : '';
  }

  static String _extractAnthropicText(Map data) {
    final content = data['content'];
    if (content is! List) return '';

    return content
        .whereType<Map>()
        .map((part) => part['text'])
        .whereType<String>()
        .join('\n');
  }

  static String _extractGoogleText(Map data) {
    final candidates = data['candidates'];
    if (candidates is! List || candidates.isEmpty) return '';

    final candidate = candidates.first;
    if (candidate is! Map) return '';
    final content = candidate['content'];
    if (content is! Map) return '';
    final parts = content['parts'];
    if (parts is! List) return '';

    return parts
        .whereType<Map>()
        .map((part) => part['text'])
        .whereType<String>()
        .join('\n');
  }
}
