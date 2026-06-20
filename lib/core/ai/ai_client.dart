import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ai_message.dart';
import 'ai_provider.dart';
import 'ai_response_parser.dart';
import 'ai_settings_controller.dart';

class AiClientException implements Exception {
  final String message;

  const AiClientException(this.message);

  @override
  String toString() => message;
}

class AiClient {
  final http.Client _client;

  AiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<String> complete({
    required AiConnectionConfig config,
    required List<AiMessage> messages,
    String? systemPrompt,
  }) async {
    if (config.apiKey.isEmpty) {
      throw const AiClientException('Najpierw skonfiguruj klucz API.');
    }
    if (config.model.isEmpty) {
      throw const AiClientException('Wpisz nazwę modelu.');
    }

    final contextMessages =
        messages.where((message) => !message.isError).toList();
    if (contextMessages.isEmpty) {
      throw const AiClientException('Wiadomość nie może być pusta.');
    }

    final request = _buildRequest(
      config: config,
      messages: contextMessages,
      systemPrompt: systemPrompt,
    );

    late final http.Response response;
    try {
      response = await _client
          .post(
            request.uri,
            headers: request.headers,
            body: jsonEncode(request.body),
          )
          .timeout(const Duration(seconds: 90));
    } on TimeoutException {
      throw const AiClientException(
          'Dostawca nie odpowiedział w ciągu 90 sekund.');
    } on http.ClientException catch (error) {
      throw AiClientException('Nie udało się połączyć z dostawcą: $error');
    }

    final decoded = _decode(response);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AiClientException(
        AiResponseParser.extractError(
            response.statusCode, response.body, decoded),
      );
    }

    final text = AiResponseParser.extractText(config.provider, decoded).trim();
    if (text.isEmpty) {
      throw const AiClientException('Dostawca zwrócił pustą odpowiedź.');
    }
    return text;
  }

  void dispose() => _client.close();

  _AiRequest _buildRequest({
    required AiConnectionConfig config,
    required List<AiMessage> messages,
    String? systemPrompt,
  }) {
    if (config.provider.usesOpenAiFormat) {
      return _AiRequest(
        uri: config.provider.endpoint(config.model),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${config.apiKey}',
        },
        body: {
          'model': config.model,
          'messages': [
            if (systemPrompt != null && systemPrompt.trim().isNotEmpty)
              {'role': 'system', 'content': systemPrompt.trim()},
            ...messages.map(
              (message) => {
                'role':
                    message.role == AiMessageRole.user ? 'user' : 'assistant',
                'content': message.content,
              },
            ),
          ],
          'temperature': 0.3,
        },
      );
    }

    switch (config.provider) {
      case AiProvider.anthropic:
        return _AiRequest(
          uri: config.provider.endpoint(config.model),
          headers: {
            'Content-Type': 'application/json',
            'x-api-key': config.apiKey,
            'anthropic-version': '2023-06-01',
          },
          body: {
            'model': config.model,
            'max_tokens': 1600,
            if (systemPrompt != null && systemPrompt.trim().isNotEmpty)
              'system': systemPrompt.trim(),
            'messages': messages
                .map(
                  (message) => {
                    'role': message.role == AiMessageRole.user
                        ? 'user'
                        : 'assistant',
                    'content': message.content,
                  },
                )
                .toList(),
          },
        );
      case AiProvider.google:
        return _AiRequest(
          uri: config.provider.endpoint(config.model),
          headers: {
            'Content-Type': 'application/json',
            'x-goog-api-key': config.apiKey,
          },
          body: {
            if (systemPrompt != null && systemPrompt.trim().isNotEmpty)
              'systemInstruction': {
                'parts': [
                  {'text': systemPrompt.trim()},
                ],
              },
            'contents': messages
                .map(
                  (message) => {
                    'role':
                        message.role == AiMessageRole.user ? 'user' : 'model',
                    'parts': [
                      {'text': message.content},
                    ],
                  },
                )
                .toList(),
            'generationConfig': {'temperature': 0.3},
          },
        );
      case AiProvider.openRouter:
      case AiProvider.nvidiaNim:
      case AiProvider.openAI:
        throw const AiClientException('Nieobsługiwany format dostawcy.');
    }
  }

  dynamic _decode(http.Response response) {
    if (response.body.isEmpty) return <String, dynamic>{};
    try {
      return jsonDecode(response.body);
    } on FormatException {
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw AiClientException(
          'Błąd API (${response.statusCode}): ${response.body}',
        );
      }
      throw const AiClientException(
        'Dostawca zwrócił odpowiedź w nieznanym formacie.',
      );
    }
  }
}

class _AiRequest {
  final Uri uri;
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  const _AiRequest({
    required this.uri,
    required this.headers,
    required this.body,
  });
}
