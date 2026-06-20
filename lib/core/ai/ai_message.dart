import 'package:flutter/foundation.dart';

enum AiMessageRole { user, assistant }

@immutable
class AiMessage {
  final AiMessageRole role;
  final String content;
  final bool isError;

  const AiMessage({
    required this.role,
    required this.content,
    this.isError = false,
  });
}
