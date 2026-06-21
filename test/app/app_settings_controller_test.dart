import 'package:codementor/app/app_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('persists the selected language and theme', () async {
    SharedPreferences.setMockInitialValues({});
    final settings = await AppSettingsController.load();

    await settings.setLanguage(AppLanguage.english);
    await settings.setThemeMode(ThemeMode.light);

    final restored = await AppSettingsController.load();
    expect(restored.language, AppLanguage.english);
    expect(restored.themeMode, ThemeMode.light);
  });
}
