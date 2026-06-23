# CodeMentor

[![Release](https://img.shields.io/github/v/release/makecode91-ship-it/CodeMentor-?display_name=tag)](https://github.com/makecode91-ship-it/CodeMentor-/releases/latest)
[![Platform](https://img.shields.io/badge/platform-Android-3DDC84?logo=android&logoColor=white)](https://github.com/makecode91-ship-it/CodeMentor-/releases/latest)
[![Flutter](https://img.shields.io/badge/Flutter-3.44.2-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/makecode91-ship-it/CodeMentor-?style=social)](https://github.com/makecode91-ship-it/CodeMentor-/stargazers)

CodeMentor is an open-source Flutter application that helps beginners learn programming through guided AI conversations, code analysis, concise reference material, and quizzes.

> **Current release:** v0.2.0 (Windows Preview 0.1)<br>
> **Platforms:** Android and Windows<br>
> **Interface languages:** Polish and English<br>
> **Tested on:** Android 15 and Windows 11

[Download CodeMentor v0.2.0 for Windows](https://github.com/makecode91-ship-it/CodeMentor-/releases/tag/v0.2.0)<br>
[Download CodeMentor v0.1.1 for Android](https://github.com/makecode91-ship-it/CodeMentor-/releases/tag/v0.1.1)

## Features

### AI programming mentor

Ask questions about programming concepts, errors, and code. The chat keeps recent conversation context and is prompted to answer in a beginner-friendly way.

Supported providers:

- OpenRouter
- NVIDIA NIM
- OpenAI
- Anthropic
- Google Gemini

CodeMentor follows a bring-your-own-key model. No shared or paid API key is bundled with the application.

### Code Playground

Write or paste Python, JavaScript, C++, or Dart code and ask the selected AI provider for a static analysis. CodeMentor can explain the code, identify likely errors and risks, and suggest an improved version.

> The current Playground analyzes code with AI. It does not execute code locally or remotely.

### Programming encyclopedia

Read short introductions, core concepts, and code examples for:

- Python
- JavaScript
- C++
- Dart

### Quizzes

Complete a short programming quiz, track the score during the session, and repeat it to improve the result.

### Localization and themes

Use CodeMentor in Polish or English and switch between light and dark themes. Language and theme preferences are stored locally and restored when the app starts again.

## Privacy and API keys

CodeMentor does not collect or bundle API keys.

- A key entered by the user stays in application memory for the current session.
- The key is sent only to the provider selected by the user.
- The key is not saved to disk by CodeMentor.
- The repository and release APK do not contain a private API key.
- Requests remain subject to the selected provider's privacy policy, limits, and pricing.

Never commit an API key to the repository or share it in an issue, screenshot, or log.

## Installation

### Windows ZIP

1. Open the [CodeMentor v0.2.0 release](https://github.com/makecode91-ship-it/CodeMentor-/releases/tag/v0.2.0).
2. Download `CodeMentor-v0.2.0-windows-x64.zip`.
3. Extract the complete ZIP to a folder.
4. Run `CodeMentor.exe` without separating it from the `data` directory or `flutter_windows.dll`.

The first Windows preview is not code-signed, so Microsoft Defender SmartScreen may show a warning. Verify the SHA-256 below before running the application.

SHA-256 for the v0.2.0 Windows ZIP:

```text
9DBF5454C2A677D73B85A107DD649D383D18759D3CA37B5DC825AE8C32B36BED
```

### Android APK

1. Open the [CodeMentor v0.1.1 Android release](https://github.com/makecode91-ship-it/CodeMentor-/releases/tag/v0.1.1).
2. Download `CodeMentor-v0.1.1-android.apk`.
3. Open the downloaded file on your Android device.
4. Allow installation from your browser or file manager if Android requests it.

v0.1.1 is a GitHub preview signed with the Flutter development key. It is not a Google Play build.

SHA-256 for the v0.1.1 APK:

```text
D37E53970EA8F7A6B10033F9CBFE436AF7F4683706E27223890E129213408135
```

### Run from source

Requirements:

- Flutter stable (v3.44.2 used for v0.1.1)
- Android SDK and accepted Android licenses
- An Android device or emulator

```bash
git clone https://github.com/makecode91-ship-it/CodeMentor-.git
cd CodeMentor-
flutter pub get
flutter analyze
flutter test
flutter run
```

To create an APK:

```bash
flutter build apk --release
```

The generated file is placed in `build/app/outputs/flutter-apk/`.

### Build Windows from source

Windows support is available from CodeMentor v0.2.0.

```powershell
flutter config --enable-windows-desktop
flutter pub get
flutter test
flutter build windows --release
```

The runnable bundle is placed in `build/windows/x64/runner/Release/`. Keep `CodeMentor.exe`, `flutter_windows.dll`, and the `data` directory together when moving the application to another computer.

## AI setup

1. Create an API key with one of the supported providers.
2. Open CodeMentor.
3. Select the settings icon in the top-right corner.
4. Choose the provider.
5. Paste the API key and verify the model name.
6. Use AI Chat or Playground.

## Project structure

The codebase is organized by responsibility:

- `lib/app`: application shell and theme
- `lib/core/ai`: providers, settings, API client, and response parsers
- `lib/features`: chat, home, playground, quiz, and settings
- `lib/l10n`: Polish and English localization resources
- `windows`: native Windows runner, metadata, and application icon
- `lib/shared/widgets`: reusable UI components
- `test`: parser and widget tests
- `android`: Android platform project

## Current limitations

- The encyclopedia and quiz content are intentionally small in v0.2.0.
- Playground analyzes code but does not run it.
- API configuration is cleared when the app session ends.
- The GitHub preview APK does not yet use a production signing key.
- The Windows preview is x64-only and does not yet have an installer or production code signing.

## Roadmap

### Delivered in v0.2.0

- [x] Add the native Flutter Windows runner
- [x] Add Windows product metadata, window sizing, and a branded executable
- [x] Validate desktop startup, responsive layout, and settings on Windows 11
- [x] Package a portable Windows ZIP with the Flutter runtime files
- [x] Publish the first Windows preview alongside Android

### Delivered in v0.1.1

- [x] Redesign settings into clear appearance, language, and AI sections
- [x] Add Polish and English localization across the full interface and learning content
- [x] Add persistent light and dark theme preferences
- [x] Make AI mentor prompts follow the selected app language
- [x] Complete Android device QA and accessibility checks
- [x] Publish the v0.1.1 preview APK and release notes

### Later releases

- Expand encyclopedia lessons and examples
- Add quiz categories, levels, and a larger question database
- Add progress tracking, XP, streaks, and learning statistics
- Add beginner learning paths and programming challenges
- Add secure, opt-in API key persistence
- Improve code formatting in AI responses
- Prepare a Linux release
- Add a signed Windows installer or MSIX package
- Add production Android signing and automated releases
- Add screenshots and demo assets

## Contributing

Contributions are welcome. Good first contributions include:

- Adding quiz questions
- Expanding an encyclopedia topic
- Testing on another Android device or version
- Improving accessibility or responsive layouts
- Improving AI provider error handling
- Writing documentation or translations

[Open an issue](https://github.com/makecode91-ship-it/CodeMentor-/issues/new) or submit a pull request with a focused description of the change.

Before submitting code, run:

```bash
flutter analyze
flutter test
```

## Release

- [CodeMentor v0.2.0 Windows release notes and ZIP](https://github.com/makecode91-ship-it/CodeMentor-/releases/tag/v0.2.0)
- [CodeMentor v0.1.1 Android release notes and APK](https://github.com/makecode91-ship-it/CodeMentor-/releases/tag/v0.1.1)

## License

CodeMentor is available under the [MIT License](LICENSE).

## Author

Created by **Make Code** as part of an effort to build practical open-source learning tools with Flutter and AI.
