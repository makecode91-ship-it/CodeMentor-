import 'package:codementor/core/ai/ai_provider.dart';
import 'package:codementor/core/ai/ai_response_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('endpoint Google nie zawiera klucza API', () {
    final endpoint = AiProvider.google.endpoint('gemini-1.5-flash');

    expect(endpoint.query, isEmpty);
  });

  group('AiResponseParser.extractText', () {
    test('odczytuje format OpenAI', () {
      final result = AiResponseParser.extractText(
        AiProvider.openAI,
        {
          'choices': [
            {
              'message': {'content': 'Odpowiedź OpenAI'},
            },
          ],
        },
      );

      expect(result, 'Odpowiedź OpenAI');
    });

    test('odczytuje format Anthropic', () {
      final result = AiResponseParser.extractText(
        AiProvider.anthropic,
        {
          'content': [
            {'type': 'text', 'text': 'Odpowiedź Anthropic'},
          ],
        },
      );

      expect(result, 'Odpowiedź Anthropic');
    });

    test('odczytuje format Google', () {
      final result = AiResponseParser.extractText(
        AiProvider.google,
        {
          'candidates': [
            {
              'content': {
                'parts': [
                  {'text': 'Odpowiedź Gemini'},
                ],
              },
            },
          ],
        },
      );

      expect(result, 'Odpowiedź Gemini');
    });

    test('zwraca pusty tekst dla nieznanego formatu', () {
      final result = AiResponseParser.extractText(AiProvider.openRouter, {});

      expect(result, isEmpty);
    });
  });

  group('AiResponseParser.extractError', () {
    test('odczytuje komunikat błędu z obiektu API', () {
      final result = AiResponseParser.extractError(
        401,
        '',
        {
          'error': {'message': 'Nieprawidłowy klucz'},
        },
      );

      expect(result, 'Błąd API (401): Nieprawidłowy klucz');
    });
  });
}
