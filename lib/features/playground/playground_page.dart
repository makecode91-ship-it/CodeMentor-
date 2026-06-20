import 'package:flutter/material.dart';

import '../../core/ai/ai_client.dart';
import '../../core/ai/ai_message.dart';
import '../../core/ai/ai_settings_controller.dart';
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
  static const _languages = [
    _Language(
      name: 'Python',
      starterCode:
          'def greet(name):\n    return f"Cześć, {name}!"\n\nprint(greet("Ada"))',
    ),
    _Language(
      name: 'JavaScript',
      starterCode:
          'function greet(name) {\n  return `Cześć, \${name}!`;\n}\n\nconsole.log(greet("Ada"));',
    ),
    _Language(
      name: 'C++',
      starterCode:
          '#include <iostream>\n#include <string>\n\nint main() {\n  std::string name = "Ada";\n  std::cout << "Cześć, " << name << "!\\n";\n}',
    ),
    _Language(
      name: 'Dart',
      starterCode:
          'String greet(String name) => "Cześć, \$name!";\n\nvoid main() {\n  print(greet("Ada"));\n}',
    ),
  ];

  late _Language _language;
  late final TextEditingController _codeController;
  String _result = '';
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _language = _languages.first;
    _codeController = TextEditingController(text: _language.starterCode);
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _changeLanguage(_Language? language) {
    if (language == null || language == _language) return;
    final replaceCode = _codeController.text.trim().isEmpty ||
        _codeController.text == _language.starterCode;
    setState(() {
      _language = language;
      if (replaceCode) _codeController.text = language.starterCode;
      _result = '';
    });
  }

  Future<void> _analyze() async {
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
            content:
                'Język: ${_language.name}\n\nKod:\n$code\n\nPrzeanalizuj kod, '
                'wskaż błędy i ryzyka, wyjaśnij działanie oraz pokaż poprawioną '
                'wersję, jeśli jest potrzebna.',
          ),
        ],
        systemPrompt:
            'Jesteś mentorem programowania. Pisz po polsku i używaj prostych, '
            'konkretnych wyjaśnień. Nie wykonujesz kodu, tylko analizujesz go statycznie.',
      );
      if (!mounted) return;
      setState(() => _result = answer);
    } on AiClientException catch (error) {
      if (!mounted) return;
      setState(() => _result = error.message);
    } catch (_) {
      if (!mounted) return;
      setState(
          () => _result = 'Wystąpił nieoczekiwany błąd. Spróbuj ponownie.');
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
                      languages: _languages,
                      selected: _language,
                      loading: _loading,
                      onChanged: _changeLanguage,
                      onAnalyze: _analyze,
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final editor =
                              _CodeEditor(controller: _codeController);
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
  final List<_Language> languages;
  final _Language selected;
  final bool loading;
  final ValueChanged<_Language?> onChanged;
  final VoidCallback onAnalyze;

  const _Toolbar({
    required this.languages,
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
          child: DropdownButtonFormField<_Language>(
            initialValue: selected,
            decoration: const InputDecoration(labelText: 'Język'),
            items: languages
                .map(
                  (language) => DropdownMenuItem(
                    value: language,
                    child: Text(language.name),
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
          label: const Text('Analizuj'),
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
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0E11),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: TextField(
        controller: controller,
        expands: true,
        maxLines: null,
        minLines: null,
        keyboardType: TextInputType.multiline,
        style: const TextStyle(
            fontFamily: 'monospace', fontSize: 14, height: 1.45),
        decoration: const InputDecoration(
          filled: false,
          border: InputBorder.none,
          hintText: 'Wpisz kod...',
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
                    'Tutaj pojawi się analiza kodu.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : SingleChildScrollView(child: SelectableText(text)),
    );
  }
}

class _Language {
  final String name;
  final String starterCode;

  const _Language({required this.name, required this.starterCode});
}
