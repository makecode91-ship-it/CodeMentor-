import 'package:flutter/material.dart';

import '../../core/ai/ai_settings_controller.dart';
import '../../l10n/l10n.dart';

class AiSetupBanner extends StatelessWidget {
  final AiSettingsController settings;
  final VoidCallback onOpenSettings;

  const AiSetupBanner({
    super.key,
    required this.settings,
    required this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settings,
      builder: (context, child) {
        if (settings.isConfigured) return const SizedBox.shrink();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Row(
            children: [
              const Icon(Icons.key_outlined),
              const SizedBox(width: 12),
              Expanded(child: Text(context.l10n.configureAiBanner)),
              TextButton(
                onPressed: onOpenSettings,
                child: Text(context.l10n.openSettings),
              ),
            ],
          ),
        );
      },
    );
  }
}
