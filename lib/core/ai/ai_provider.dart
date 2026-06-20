enum AiProvider {
  openRouter,
  nvidiaNim,
  openAI,
  anthropic,
  google,
}

extension AiProviderInfo on AiProvider {
  String get label {
    switch (this) {
      case AiProvider.openRouter:
        return 'OpenRouter';
      case AiProvider.nvidiaNim:
        return 'NVIDIA NIM';
      case AiProvider.openAI:
        return 'OpenAI';
      case AiProvider.anthropic:
        return 'Anthropic';
      case AiProvider.google:
        return 'Google Gemini';
    }
  }

  String get defaultModel {
    switch (this) {
      case AiProvider.openRouter:
        return 'openai/gpt-4o-mini';
      case AiProvider.nvidiaNim:
        return 'meta/llama-3.1-70b-instruct';
      case AiProvider.openAI:
        return 'gpt-4o-mini';
      case AiProvider.anthropic:
        return 'claude-3-5-sonnet-latest';
      case AiProvider.google:
        return 'gemini-1.5-flash';
    }
  }

  bool get usesOpenAiFormat {
    switch (this) {
      case AiProvider.openRouter:
      case AiProvider.nvidiaNim:
      case AiProvider.openAI:
        return true;
      case AiProvider.anthropic:
      case AiProvider.google:
        return false;
    }
  }

  Uri endpoint(String model) {
    switch (this) {
      case AiProvider.openRouter:
        return Uri.parse('https://openrouter.ai/api/v1/chat/completions');
      case AiProvider.nvidiaNim:
        return Uri.parse(
            'https://integrate.api.nvidia.com/v1/chat/completions');
      case AiProvider.openAI:
        return Uri.parse('https://api.openai.com/v1/chat/completions');
      case AiProvider.anthropic:
        return Uri.parse('https://api.anthropic.com/v1/messages');
      case AiProvider.google:
        final normalizedModel =
            model.startsWith('models/') ? model.substring(7) : model;
        return Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/'
          '$normalizedModel:generateContent',
        );
    }
  }
}
