import 'package:flutter/material.dart';

import '../core/ai/ai_client.dart';
import '../core/ai/ai_settings_controller.dart';
import '../features/chat/ai_chat_page.dart';
import '../features/encyclopedia/encyclopedia_page.dart';
import '../features/home/home_page.dart';
import '../features/playground/playground_page.dart';
import '../features/quiz/quiz_page.dart';
import '../features/settings/ai_settings_sheet.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  static const _titles = [
    'CodeMentor',
    'Asystent AI',
    'Encyklopedia',
    'Playground',
    'Quizy',
  ];

  final AiSettingsController _settings = AiSettingsController();
  final AiClient _aiClient = AiClient();
  late final List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        settings: _settings,
        onNavigate: _selectPage,
        onOpenSettings: _openSettings,
      ),
      AiChatPage(
        settings: _settings,
        aiClient: _aiClient,
        onOpenSettings: _openSettings,
      ),
      const EncyclopediaPage(),
      PlaygroundPage(
        settings: _settings,
        aiClient: _aiClient,
        onOpenSettings: _openSettings,
      ),
      const QuizPage(),
    ];
  }

  @override
  void dispose() {
    _aiClient.dispose();
    _settings.dispose();
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (context) => AiSettingsSheet(settings: _settings),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final useRail = constraints.maxWidth >= 1000;
        final content = IndexedStack(
          index: _currentIndex,
          children: _pages,
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(_titles[_currentIndex]),
            actions: [
              IconButton(
                tooltip: 'Ustawienia AI',
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
                      destinations: _railDestinations,
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
                  destinations: _navigationDestinations,
                ),
        );
      },
    );
  }

  static const _navigationDestinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Start',
    ),
    NavigationDestination(
      icon: Icon(Icons.smart_toy_outlined),
      selectedIcon: Icon(Icons.smart_toy),
      label: 'AI',
    ),
    NavigationDestination(
      icon: Icon(Icons.menu_book_outlined),
      selectedIcon: Icon(Icons.menu_book),
      label: 'Wiki',
    ),
    NavigationDestination(
      icon: Icon(Icons.code_outlined),
      selectedIcon: Icon(Icons.code),
      label: 'Kod',
    ),
    NavigationDestination(
      icon: Icon(Icons.quiz_outlined),
      selectedIcon: Icon(Icons.quiz),
      label: 'Quizy',
    ),
  ];

  static const _railDestinations = [
    NavigationRailDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: Text('Start'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.smart_toy_outlined),
      selectedIcon: Icon(Icons.smart_toy),
      label: Text('AI'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.menu_book_outlined),
      selectedIcon: Icon(Icons.menu_book),
      label: Text('Wiki'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.code_outlined),
      selectedIcon: Icon(Icons.code),
      label: Text('Kod'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.quiz_outlined),
      selectedIcon: Icon(Icons.quiz),
      label: Text('Quizy'),
    ),
  ];
}
