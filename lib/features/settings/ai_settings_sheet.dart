import 'package:flutter/material.dart';

import '../../core/ai/ai_provider.dart';
import '../../core/ai/ai_settings_controller.dart';

class AiSettingsSheet extends StatefulWidget {
  final AiSettingsController settings;

  const AiSettingsSheet({
    super.key,
    required this.settings,
  });

  @override
  State<AiSettingsSheet> createState() => _AiSettingsSheetState();
}

class _AiSettingsSheetState extends State<AiSettingsSheet> {
  final _formKey = GlobalKey<FormState>();
  late AiProvider _provider;
  late final TextEditingController _apiKeyController;
  late final TextEditingController _modelController;
  bool _obscureApiKey = true;

  @override
  void initState() {
    super.initState();
    _provider = widget.settings.provider;
    _apiKeyController = TextEditingController(text: widget.settings.apiKey);
    _modelController = TextEditingController(text: widget.settings.model);
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    _modelController.dispose();
    super.dispose();
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    widget.settings.update(
      provider: _provider,
      apiKey: _apiKeyController.text,
      model: _modelController.text,
    );
    Navigator.of(context).pop();
  }

  void _clearKey() {
    _apiKeyController.clear();
    widget.settings.clearApiKey();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottomInset),
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Połączenie z AI',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Zamknij',
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Klucz jest przechowywany tylko w pamięci bieżącej sesji.',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<AiProvider>(
                    initialValue: _provider,
                    isExpanded: true,
                    decoration: const InputDecoration(labelText: 'Dostawca'),
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
                      final replaceModel =
                          _modelController.text.trim().isEmpty ||
                              _modelController.text.trim() == previousDefault;
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
                      labelText: 'Klucz API',
                      suffixIcon: IconButton(
                        tooltip: _obscureApiKey ? 'Pokaż klucz' : 'Ukryj klucz',
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
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Wklej klucz API.'
                        : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _modelController,
                    autocorrect: false,
                    decoration: const InputDecoration(labelText: 'Model'),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Wpisz nazwę modelu.'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: _clearKey,
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Wyczyść klucz'),
                      ),
                      const Spacer(),
                      FilledButton.icon(
                        onPressed: _save,
                        icon: const Icon(Icons.check),
                        label: const Text('Zastosuj'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
