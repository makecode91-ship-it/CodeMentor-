import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/ai/ai_client.dart';
import '../../core/ai/ai_message.dart';
import '../../core/ai/ai_provider.dart';
import '../../core/ai/ai_settings_controller.dart';
import '../../shared/widgets/ai_setup_banner.dart';

class AiChatPage extends StatefulWidget {
  final AiSettingsController settings;
  final AiClient aiClient;
  final VoidCallback onOpenSettings;

  const AiChatPage({
    super.key,
    required this.settings,
    required this.aiClient,
    required this.onOpenSettings,
  });

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<AiMessage> _messages = [];
  bool _loading = false;

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty || _loading) return;
    if (!widget.settings.isConfigured) {
      widget.onOpenSettings();
      return;
    }

    setState(() {
      _messages.add(AiMessage(role: AiMessageRole.user, content: text));
      _loading = true;
    });
    _messageController.clear();
    _scrollToBottom();

    var contextStart = _messages.length > 12 ? _messages.length - 12 : 0;
    if (_messages[contextStart].role == AiMessageRole.assistant) {
      contextStart++;
    }
    final conversation = _messages.sublist(contextStart);

    try {
      final answer = await widget.aiClient.complete(
        config: widget.settings.config,
        messages: conversation,
        systemPrompt:
            'Jesteś cierpliwym mentorem programowania. Odpowiadaj po polsku, '
            'wyjaśniaj tok rozumowania krok po kroku i dostosuj poziom do osoby '
            'początkującej. Kod umieszczaj w czytelnych blokach.',
      );
      if (!mounted) return;
      setState(() {
        _messages
            .add(AiMessage(role: AiMessageRole.assistant, content: answer));
      });
    } on AiClientException catch (error) {
      if (!mounted) return;
      setState(() {
        _messages.add(
          AiMessage(
            role: AiMessageRole.assistant,
            content: error.message,
            isError: true,
          ),
        );
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _messages.add(
          const AiMessage(
            role: AiMessageRole.assistant,
            content: 'Wystąpił nieoczekiwany błąd. Spróbuj ponownie.',
            isError: true,
          ),
        );
      });
    } finally {
      if (mounted) {
        setState(() => _loading = false);
        _scrollToBottom();
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  void _clearConversation() {
    if (_messages.isEmpty || _loading) return;
    setState(_messages.clear);
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
              constraints: const BoxConstraints(maxWidth: 960),
              child: Column(
                children: [
                  _ChatToolbar(
                    settings: widget.settings,
                    canClear: _messages.isNotEmpty && !_loading,
                    onClear: _clearConversation,
                  ),
                  Expanded(
                    child: _messages.isEmpty
                        ? const _EmptyChat()
                        : ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            itemCount: _messages.length,
                            itemBuilder: (context, index) => _MessageBubble(
                              message: _messages[index],
                            ),
                          ),
                  ),
                  if (_loading) const LinearProgressIndicator(minHeight: 2),
                  _Composer(
                    controller: _messageController,
                    loading: _loading,
                    onSend: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChatToolbar extends StatelessWidget {
  final AiSettingsController settings;
  final bool canClear;
  final VoidCallback onClear;

  const _ChatToolbar({
    required this.settings,
    required this.canClear,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settings,
      builder: (context, child) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                settings.isConfigured
                    ? '${settings.provider.label} · ${settings.model}'
                    : 'Brak aktywnego modelu',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 13,
                ),
              ),
            ),
            IconButton(
              tooltip: 'Wyczyść rozmowę',
              onPressed: canClear ? onClear : null,
              icon: const Icon(Icons.delete_sweep_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyChat extends StatelessWidget {
  const _EmptyChat();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.forum_outlined,
              size: 42,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 14),
            const Text(
              'Zadaj pierwsze pytanie',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              'Możesz poprosić o wyjaśnienie pojęcia, błędu lub fragmentu kodu.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final AiMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == AiMessageRole.user;
    final colors = Theme.of(context).colorScheme;
    final background = message.isError
        ? colors.errorContainer
        : isUser
            ? colors.primaryContainer
            : colors.surfaceContainerHigh;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 720),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(message.content),
            if (!isUser && !message.isError)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  tooltip: 'Kopiuj odpowiedź',
                  visualDensity: VisualDensity.compact,
                  onPressed: () => Clipboard.setData(
                    ClipboardData(text: message.content),
                  ),
                  icon: const Icon(Icons.copy_outlined, size: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Composer extends StatelessWidget {
  final TextEditingController controller;
  final bool loading;
  final VoidCallback onSend;

  const _Composer({
    required this.controller,
    required this.loading,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 5,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                hintText: 'Napisz pytanie o programowanie...',
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            tooltip: 'Wyślij',
            onPressed: loading ? null : onSend,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
