import 'package:flutter/material.dart';

import 'app/app_settings_controller.dart';
import 'app/codementor_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appSettings = await AppSettingsController.load();
  runApp(CodeMentorApp(appSettings: appSettings));
}
