import 'package:flutter/widgets.dart';

import '../core/ai/ai_client.dart';
import 'generated/app_localizations.dart';

export 'generated/app_localizations.dart';

extension AppLocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension AiClientLocalizations on AppLocalizations {
  AiClientMessages get aiClientMessages => AiClientMessages(
        configureApiKey: configureApiKeyError,
        enterModel: enterModelError,
        emptyMessage: emptyMessageError,
        providerTimeout: providerTimeoutError,
        connectionFailed: connectionFailedError,
        emptyProviderResponse: emptyProviderResponseError,
        unsupportedProvider: unsupportedProviderError,
        unknownResponseFormat: unknownResponseFormatError,
        apiErrorLabel: apiErrorLabel,
      );
}
