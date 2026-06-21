import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppLanguage {
  polish('pl'),
  english('en');

  final String code;

  const AppLanguage(this.code);

  static AppLanguage fromCode(String? code) {
    return values.firstWhere(
      (language) => language.code == code,
      orElse: () => AppLanguage.polish,
    );
  }
}

class AppSettingsController extends ChangeNotifier {
  static const _languageKey = 'app_language';
  static const _themeModeKey = 'theme_mode';

  final SharedPreferences? _preferences;
  AppLanguage _language;
  ThemeMode _themeMode;

  AppSettingsController({
    AppLanguage language = AppLanguage.polish,
    ThemeMode themeMode = ThemeMode.dark,
  })  : _preferences = null,
        _language = language,
        _themeMode = themeMode;

  AppSettingsController._({
    required SharedPreferences preferences,
    required AppLanguage language,
    required ThemeMode themeMode,
  })  : _preferences = preferences,
        _language = language,
        _themeMode = themeMode;

  static Future<AppSettingsController> load() async {
    final preferences = await SharedPreferences.getInstance();
    final language = AppLanguage.fromCode(
      preferences.getString(_languageKey),
    );
    final savedTheme = preferences.getString(_themeModeKey);
    final themeMode =
        savedTheme == ThemeMode.light.name ? ThemeMode.light : ThemeMode.dark;

    return AppSettingsController._(
      preferences: preferences,
      language: language,
      themeMode: themeMode,
    );
  }

  AppLanguage get language => _language;
  Locale get locale => Locale(_language.code);
  ThemeMode get themeMode => _themeMode;

  Future<void> setLanguage(AppLanguage language) async {
    if (_language == language) return;
    _language = language;
    notifyListeners();
    await _preferences?.setString(_languageKey, language.code);
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    if (_themeMode == themeMode) return;
    _themeMode = themeMode;
    notifyListeners();
    await _preferences?.setString(_themeModeKey, themeMode.name);
  }
}
