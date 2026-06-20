import 'package:flutter/material.dart';

import 'app_shell.dart';
import 'app_theme.dart';

class CodeMentorApp extends StatelessWidget {
  const CodeMentorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodeMentor',
      theme: AppTheme.dark,
      home: const AppShell(),
    );
  }
}
