import 'package:codementor/app/app_settings_controller.dart';
import 'package:codementor/app/codementor_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays the Polish home screen in dark mode by default',
      (tester) async {
    final settings = AppSettingsController();

    await tester.pumpWidget(CodeMentorApp(appSettings: settings));
    await tester.pumpAndSettle();

    expect(find.text('CodeMentor'), findsOneWidget);
    expect(find.text('Ucz się programowania przez praktykę'), findsOneWidget);
    expect(find.text('Start'), findsOneWidget);
    expect(settings.themeMode, ThemeMode.dark);
  });

  testWidgets('changes the language and theme from settings', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final settings = AppSettingsController();

    await tester.pumpWidget(CodeMentorApp(appSettings: settings));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Ustawienia'));
    await tester.pumpAndSettle();

    expect(find.text('Wygląd i język'), findsOneWidget);
    await tester.tap(find.text('Jasny'));
    await tester.pumpAndSettle();

    expect(settings.themeMode, ThemeMode.light);

    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();

    expect(settings.language, AppLanguage.english);
    expect(find.text('Appearance and language'), findsOneWidget);
    expect(find.text('Learn programming through practice'), findsOneWidget);
  });
}
