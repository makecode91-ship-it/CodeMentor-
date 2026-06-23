import 'package:flutter/material.dart';

import '../../core/ai/ai_client.dart';
import '../../core/ai/ai_message.dart';
import '../../core/ai/ai_settings_controller.dart';
import '../../l10n/l10n.dart';
import '../../shared/widgets/ai_setup_banner.dart';

class PlaygroundPage extends StatefulWidget {
  final AiSettingsController settings;
  final AiClient aiClient;
  final VoidCallback onOpenSettings;

  const PlaygroundPage({
    super.key,
    required this.settings,
    required this.aiClient,
    required this.onOpenSettings,
  });

  @override
  State<PlaygroundPage> createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  _ProgrammingLanguage _language = _ProgrammingLanguage.python;
  late final TextEditingController _codeController;
  String _currentStarterCode = '';
  String _result = '';
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final localizedStarter = _language.starterCode(context.l10n);
    if (_currentStarterCode.isEmpty) {
      _codeController.text = localizedStarter;
    } else if (_codeController.text == _currentStarterCode) {
      _codeController.text = localizedStarter;
    }
    _currentStarterCode = localizedStarter;
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _changeLanguage(_ProgrammingLanguage? language) {
    if (language == null || language == _language) return;
    final replaceCode = _codeController.text.trim().isEmpty ||
        _codeController.text == _currentStarterCode;
    final starterCode = language.starterCode(context.l10n);

    setState(() {
      _language = language;
      _currentStarterCode = starterCode;
      if (replaceCode) _codeController.text = starterCode;
      _result = '';
    });
  }

  Future<void> _analyze() async {
    final l10n = context.l10n;
    final code = _codeController.text.trim();
    if (code.isEmpty || _loading) return;
    if (!widget.settings.isConfigured) {
      widget.onOpenSettings();
      return;
    }

    setState(() {
      _loading = true;
      _result = '';
    });

    try {
      final answer = await widget.aiClient.complete(
        config: widget.settings.config,
        messages: [
          AiMessage(
            role: AiMessageRole.user,
            content: l10n.playgroundUserPrompt(_language.label, code),
          ),
        ],
        systemPrompt: l10n.playgroundSystemPrompt,
        localizedMessages: l10n.aiClientMessages,
      );
      if (!mounted) return;
      setState(() => _result = answer);
    } on AiClientException catch (error) {
      if (!mounted) return;
      setState(() => _result = error.message);
    } catch (_) {
      if (!mounted) return;
      setState(() => _result = l10n.unexpectedError);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AiSetupBanner(
          settings: widget.settings,
          onOpenSettings: widget.onOpenSettings,
        ),
        Expanded(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _Toolbar(
                      selected: _language,
                      loading: _loading,
                      onChanged: _changeLanguage,
                      onAnalyze: _analyze,
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final editor = _CodeEditor(
                            controller: _codeController,
                          );
                          final result = _AnalysisResult(
                            text: _result,
                            loading: _loading,
                          );
                          if (constraints.maxWidth >= 860) {
                            return Row(
                              children: [
                                Expanded(child: editor),
                                const SizedBox(width: 12),
                                Expanded(child: result),
                              ],
                            );
                          }
                          return Column(
                            children: [
                              Expanded(child: editor),
                              const SizedBox(height: 12),
                              Expanded(child: result),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Toolbar extends StatelessWidget {
  final _ProgrammingLanguage selected;
  final bool loading;
  final ValueChanged<_ProgrammingLanguage?> onChanged;
  final VoidCallback onAnalyze;

  const _Toolbar({
    required this.selected,
    required this.loading,
    required this.onChanged,
    required this.onAnalyze,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 180,
          child: DropdownButtonFormField<_ProgrammingLanguage>(
            initialValue: selected,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: context.l10n.programmingLanguageLabel,
            ),
            items: _ProgrammingLanguage.values
                .map(
                  (language) => DropdownMenuItem(
                    value: language,
                    child: Text(language.label),
                  ),
                )
                .toList(),
            onChanged: loading ? null : onChanged,
          ),
        ),
        const Spacer(),
        FilledButton.icon(
          onPressed: loading ? null : onAnalyze,
          icon: const Icon(Icons.auto_fix_high),
          label: Text(context.l10n.analyze),
        ),
      ],
    );
  }
}

class _CodeEditor extends StatelessWidget {
  final TextEditingController controller;

  const _CodeEditor({required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: TextField(
        controller: controller,
        expands: true,
        maxLines: null,
        minLines: null,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
          height: 1.45,
          color: colors.onSurface,
        ),
        decoration: InputDecoration(
          filled: false,
          border: InputBorder.none,
          hintText: context.l10n.codeHint,
        ),
      ),
    );
  }
}

class _AnalysisResult extends StatelessWidget {
  final String text;
  final bool loading;

  const _AnalysisResult({required this.text, required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : text.isEmpty
              ? Center(
                  child: Text(
                    context.l10n.analysisPlaceholder,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : SingleChildScrollView(child: SelectableText(text)),
    );
  }
}

enum _ProgrammingLanguage {
  python('Python'),
  javascript('JavaScript'),
  cpp('C++'),
  dart('Dart');

  final String label;

  const _ProgrammingLanguage(this.label);

  String starterCode(AppLocalizations l10n) {
    final greeting = l10n.starterGreeting;
    return switch (this) {
      _ProgrammingLanguage.python =>
        'def greet(name):\n    return f"$greeting, {name}!"\n\nprint(greet("Ada"))',
      _ProgrammingLanguage.javascript =>
        'function greet(name) {\n  return `$greeting, \${name}!`;\n}\n\nconsole.log(greet("Ada"));',
      _ProgrammingLanguage.cpp =>
        '#include <iostream>\n#include <string>\n\nint main() {\n  std::string name = "Ada";\n  std::cout << "$greeting, " << name << "!\\n";\n}',
      _ProgrammingLanguage.dart =>
        'String greet(String name) => "$greeting, \$name!";\n\nvoid main() {\n  print(greet("Ada"));\n}',
    };
  }
}
