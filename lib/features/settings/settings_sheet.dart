import 'package:flutter/material.dart';

import '../../app/app_settings_controller.dart';
import '../../core/ai/ai_provider.dart';
import '../../core/ai/ai_settings_controller.dart';
import '../../l10n/l10n.dart';

class SettingsSheet extends StatefulWidget {
  final AppSettingsController appSettings;
  final AiSettingsController aiSettings;

  const SettingsSheet({
    super.key,
    required this.appSettings,
    required this.aiSettings,
  });

  @override
  State<SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends State<SettingsSheet> {
  final _formKey = GlobalKey<FormState>();
  late AiProvider _provider;
  late final TextEditingController _apiKeyController;
  late final TextEditingController _modelController;
  bool _obscureApiKey = true;

  @override
  void initState() {
    super.initState();
    _provider = widget.aiSettings.provider;
    _apiKeyController = TextEditingController(text: widget.aiSettings.apiKey);
    _modelController = TextEditingController(text: widget.aiSettings.model);
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    _modelController.dispose();
    super.dispose();
  }

  void _saveAiSettings() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    widget.aiSettings.update(
      provider: _provider,
      apiKey: _apiKeyController.text,
      model: _modelController.text,
    );
    Navigator.of(context).pop();
  }

  void _clearKey() {
    _apiKeyController.clear();
    widget.aiSettings.clearApiKey();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).colorScheme;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return ColoredBox(
      key: const Key('settings-background'),
      color: colors.surface,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottomInset),
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.settingsTitle,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          tooltip: l10n.close,
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.settingsDescription,
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                    const SizedBox(height: 24),
                    _SectionHeading(
                      icon: Icons.palette_outlined,
                      label: l10n.appearanceLanguageHeading,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      l10n.languageLabel,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    ListenableBuilder(
                      listenable: widget.appSettings,
                      builder: (context, child) => SegmentedButton<AppLanguage>(
                        expandedInsets: EdgeInsets.zero,
                        showSelectedIcon: false,
                        segments: [
                          ButtonSegment(
                            value: AppLanguage.polish,
                            icon: const Icon(Icons.translate),
                            label: Text(context.l10n.polishLabel),
                          ),
                          ButtonSegment(
                            value: AppLanguage.english,
                            icon: const Icon(Icons.language),
                            label: Text(context.l10n.englishLabel),
                          ),
                        ],
                        selected: {widget.appSettings.language},
                        onSelectionChanged: (selection) {
                          widget.appSettings.setLanguage(selection.first);
                        },
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.themeLabel,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    ListenableBuilder(
                      listenable: widget.appSettings,
                      builder: (context, child) => SegmentedButton<ThemeMode>(
                        expandedInsets: EdgeInsets.zero,
                        showSelectedIcon: false,
                        segments: [
                          ButtonSegment(
                            value: ThemeMode.dark,
                            icon: const Icon(Icons.dark_mode_outlined),
                            label: Text(context.l10n.darkThemeLabel),
                          ),
                          ButtonSegment(
                            value: ThemeMode.light,
                            icon: const Icon(Icons.light_mode_outlined),
                            label: Text(context.l10n.lightThemeLabel),
                          ),
                        ],
                        selected: {widget.appSettings.themeMode},
                        onSelectionChanged: (selection) {
                          widget.appSettings.setThemeMode(selection.first);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      l10n.preferencesSavedAutomatically,
                      style: TextStyle(
                        color: colors.onSurfaceVariant,
                        fontSize: 13,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Divider(height: 1),
                    ),
                    _SectionHeading(
                      icon: Icons.key_outlined,
                      label: l10n.aiConnectionHeading,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.sessionKeyNotice,
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                    const SizedBox(height: 18),
                    DropdownButtonFormField<AiProvider>(
                      initialValue: _provider,
                      isExpanded: true,
                      decoration:
                          InputDecoration(labelText: l10n.providerLabel),
                      items: AiProvider.values
                          .map(
                            (provider) => DropdownMenuItem(
                              value: provider,
                              child: Text(provider.label),
                            ),
                          )
                          .toList(),
                      onChanged: (provider) {
                        if (provider == null) return;
                        final previousDefault = _provider.defaultModel;
                        final currentModel = _modelController.text.trim();
                        final replaceModel = currentModel.isEmpty ||
                            currentModel == previousDefault;
                        setState(() {
                          _provider = provider;
                          if (replaceModel) {
                            _modelController.text = provider.defaultModel;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _apiKeyController,
                      obscureText: _obscureApiKey,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: l10n.apiKeyLabel,
                        suffixIcon: IconButton(
                          tooltip: _obscureApiKey
                              ? l10n.showKeyTooltip
                              : l10n.hideKeyTooltip,
                          onPressed: () => setState(
                            () => _obscureApiKey = !_obscureApiKey,
                          ),
                          icon: Icon(
                            _obscureApiKey
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                              ? context.l10n.apiKeyRequired
                              : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _modelController,
                      autocorrect: false,
                      decoration: InputDecoration(labelText: l10n.modelLabel),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                              ? context.l10n.modelRequired
                              : null,
                    ),
                    const SizedBox(height: 20),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final clearButton = OutlinedButton.icon(
                          onPressed: _clearKey,
                          icon: const Icon(Icons.delete_outline),
                          label: Text(l10n.clearKey),
                        );
                        final saveButton = FilledButton.icon(
                          onPressed: _saveAiSettings,
                          icon: const Icon(Icons.check),
                          label: Text(l10n.saveAiSettings),
                        );

                        if (constraints.maxWidth < 440) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              saveButton,
                              const SizedBox(height: 10),
                              clearButton,
                            ],
                          );
                        }

                        return Row(
                          children: [
                            clearButton,
                            const Spacer(),
                            saveButton,
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SectionHeading({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 21, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
