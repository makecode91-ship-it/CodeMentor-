import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import 'app_settings_controller.dart';
import 'app_shell.dart';
import 'app_theme.dart';

class CodeMentorApp extends StatefulWidget {
  final AppSettingsController? appSettings;

  const CodeMentorApp({
    super.key,
    this.appSettings,
  });

  @override
  State<CodeMentorApp> createState() => _CodeMentorAppState();
}

class _CodeMentorAppState extends State<CodeMentorApp> {
  late final AppSettingsController _appSettings;
  late final bool _ownsSettings;

  @override
  void initState() {
    super.initState();
    _ownsSettings = widget.appSettings == null;
    _appSettings = widget.appSettings ?? AppSettingsController();
  }

  @override
  void dispose() {
    if (_ownsSettings) _appSettings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _appSettings,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => context.l10n.appTitle,
        locale: _appSettings.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: _appSettings.themeMode,
        home: AppShell(appSettings: _appSettings),
      ),
    );
  }
}
