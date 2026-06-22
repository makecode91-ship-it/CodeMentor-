import 'package:flutter/material.dart';

import '../core/ai/ai_client.dart';
import '../core/ai/ai_settings_controller.dart';
import '../features/chat/ai_chat_page.dart';
import '../features/encyclopedia/encyclopedia_page.dart';
import '../features/home/home_page.dart';
import '../features/playground/playground_page.dart';
import '../features/quiz/quiz_page.dart';
import '../features/settings/settings_sheet.dart';
import '../l10n/l10n.dart';
import 'app_settings_controller.dart';

class AppShell extends StatefulWidget {
  final AppSettingsController appSettings;

  const AppShell({
    super.key,
    required this.appSettings,
  });

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final AiSettingsController _aiSettings = AiSettingsController();
  final AiClient _aiClient = AiClient();
  late final List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        settings: _aiSettings,
        onNavigate: _selectPage,
        onOpenSettings: _openSettings,
      ),
      AiChatPage(
        settings: _aiSettings,
        aiClient: _aiClient,
        onOpenSettings: _openSettings,
      ),
      const EncyclopediaPage(),
      PlaygroundPage(
        settings: _aiSettings,
        aiClient: _aiClient,
        onOpenSettings: _openSettings,
      ),
      const QuizPage(),
    ];
  }

  @override
  void dispose() {
    _aiClient.dispose();
    _aiSettings.dispose();
    super.dispose();
  }

  void _selectPage(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
  }

  Future<void> _openSettings() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SettingsSheet(
        appSettings: widget.appSettings,
        aiSettings: _aiSettings,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final titles = [
      l10n.appTitle,
      l10n.chatPageTitle,
      l10n.encyclopediaPageTitle,
      l10n.playgroundPageTitle,
      l10n.quizzesPageTitle,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final useRail = constraints.maxWidth >= 1000;
        final content = IndexedStack(
          index: _currentIndex,
          children: _pages,
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(titles[_currentIndex]),
            actions: [
              IconButton(
                tooltip: l10n.settingsTooltip,
                onPressed: _openSettings,
                icon: const Icon(Icons.settings_outlined),
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: useRail
              ? Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _currentIndex,
                      onDestinationSelected: _selectPage,
                      labelType: NavigationRailLabelType.all,
                      destinations: _railDestinations(l10n),
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(child: content),
                  ],
                )
              : content,
          bottomNavigationBar: useRail
              ? null
              : NavigationBar(
                  selectedIndex: _currentIndex,
                  onDestinationSelected: _selectPage,
                  destinations: _navigationDestinations(l10n),
                ),
        );
      },
    );
  }

  List<NavigationDestination> _navigationDestinations(
    AppLocalizations l10n,
  ) {
    return [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: l10n.navHome,
      ),
      NavigationDestination(
        icon: const Icon(Icons.smart_toy_outlined),
        selectedIcon: const Icon(Icons.smart_toy),
        label: l10n.navAi,
      ),
      NavigationDestination(
        icon: const Icon(Icons.menu_book_outlined),
        selectedIcon: const Icon(Icons.menu_book),
        label: l10n.navWiki,
      ),
      NavigationDestination(
        icon: const Icon(Icons.code_outlined),
        selectedIcon: const Icon(Icons.code),
        label: l10n.navCode,
      ),
      NavigationDestination(
        icon: const Icon(Icons.quiz_outlined),
        selectedIcon: const Icon(Icons.quiz),
        label: l10n.navQuizzes,
      ),
    ];
  }

  List<NavigationRailDestination> _railDestinations(
    AppLocalizations l10n,
  ) {
    return [
      NavigationRailDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: Text(l10n.navHome),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.smart_toy_outlined),
        selectedIcon: const Icon(Icons.smart_toy),
        label: Text(l10n.navAi),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.menu_book_outlined),
        selectedIcon: const Icon(Icons.menu_book),
        label: Text(l10n.navWiki),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.code_outlined),
        selectedIcon: const Icon(Icons.code),
        label: Text(l10n.navCode),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.quiz_outlined),
        selectedIcon: const Icon(Icons.quiz),
        label: Text(l10n.navQuizzes),
      ),
    ];
  }
}
