import 'package:flutter/material.dart';

import '../../core/ai/ai_provider.dart';
import '../../core/ai/ai_settings_controller.dart';

class HomePage extends StatelessWidget {
  final AiSettingsController settings;
  final ValueChanged<int> onNavigate;
  final VoidCallback onOpenSettings;

  const HomePage({
    super.key,
    required this.settings,
    required this.onNavigate,
    required this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Ucz się programowania przez praktykę',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Pytaj, analizuj kod i sprawdzaj wiedzę w jednym miejscu.',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            ListenableBuilder(
              listenable: settings,
              builder: (context, child) => _AiStatus(
                configured: settings.isConfigured,
                provider: settings.provider.label,
                model: settings.model,
                onPressed: onOpenSettings,
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Narzędzia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 840 ? 4 : 2;
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: columns,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: constraints.maxWidth >= 840 ? 1.35 : 1.05,
                  children: [
                    _ActionTile(
                      icon: Icons.smart_toy_outlined,
                      title: 'Asystent AI',
                      subtitle: 'Rozwiązuj problemy',
                      onTap: () => onNavigate(1),
                    ),
                    _ActionTile(
                      icon: Icons.menu_book_outlined,
                      title: 'Encyklopedia',
                      subtitle: 'Poznawaj podstawy',
                      onTap: () => onNavigate(2),
                    ),
                    _ActionTile(
                      icon: Icons.code_outlined,
                      title: 'Playground',
                      subtitle: 'Analizuj swój kod',
                      onTap: () => onNavigate(3),
                    ),
                    _ActionTile(
                      icon: Icons.quiz_outlined,
                      title: 'Quizy',
                      subtitle: 'Sprawdzaj postępy',
                      onTap: () => onNavigate(4),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AiStatus extends StatelessWidget {
  final bool configured;
  final String provider;
  final String model;
  final VoidCallback onPressed;

  const _AiStatus({
    required this.configured,
    required this.provider,
    required this.model,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            configured ? Icons.cloud_done_outlined : Icons.cloud_off_outlined,
            color: configured ? colors.primary : colors.secondary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  configured ? 'AI jest gotowe' : 'AI wymaga konfiguracji',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Text(
                  configured ? '$provider · $model' : 'Dodaj własny klucz API.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: colors.onSurfaceVariant),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Konfiguruj AI',
            onPressed: onPressed,
            icon: const Icon(Icons.tune),
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.surfaceContainer,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 30, color: colors.primary),
              const Spacer(),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
