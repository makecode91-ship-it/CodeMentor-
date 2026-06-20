import 'package:flutter/foundation.dart';

import 'ai_provider.dart';

@immutable
class AiConnectionConfig {
  final AiProvider provider;
  final String apiKey;
  final String model;

  const AiConnectionConfig({
    required this.provider,
    required this.apiKey,
    required this.model,
  });

  bool get isConfigured => apiKey.trim().isNotEmpty && model.trim().isNotEmpty;
}

class AiSettingsController extends ChangeNotifier {
  AiProvider _provider = AiProvider.openRouter;
  String _apiKey = '';
  String _model = AiProvider.openRouter.defaultModel;

  AiProvider get provider => _provider;
  String get apiKey => _apiKey;
  String get model => _model;
  bool get isConfigured => _apiKey.isNotEmpty && _model.isNotEmpty;

  AiConnectionConfig get config => AiConnectionConfig(
        provider: _provider,
        apiKey: _apiKey,
        model: _model,
      );

  void update({
    required AiProvider provider,
    required String apiKey,
    required String model,
  }) {
    _provider = provider;
    _apiKey = apiKey.trim();
    _model = model.trim();
    notifyListeners();
  }

  void clearApiKey() {
    if (_apiKey.isEmpty) return;
    _apiKey = '';
    notifyListeners();
  }
}
