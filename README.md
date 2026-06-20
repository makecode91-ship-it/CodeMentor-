# CodeMentor

[![Release](https://img.shields.io/github/v/release/makecode91-ship-it/CodeMentor-?display_name=tag)](https://github.com/makecode91-ship-it/CodeMentor-/releases/latest)
[![Platform](https://img.shields.io/badge/platform-Android-3DDC84?logo=android&logoColor=white)](https://github.com/makecode91-ship-it/CodeMentor-/releases/latest)
[![Flutter](https://img.shields.io/badge/Flutter-3.44.2-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/makecode91-ship-it/CodeMentor-?style=social)](https://github.com/makecode91-ship-it/CodeMentor-/stargazers)

CodeMentor is an open-source Flutter application that helps beginners learn programming through guided AI conversations, code analysis, concise reference material, and quizzes.

> **Current release:** v0.1.0<br>
> **Platform:** Android<br>
> **Interface language:** Polish<br>
> **Tested on:** Android 15

[Download CodeMentor v0.1.0 for Android](https://github.com/makecode91-ship-it/CodeMentor-/releases/tag/v0.1.0)

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

## Privacy and API keys

CodeMentor does not collect or bundle API keys.

- A key entered by the user stays in application memory for the current session.
- The key is sent only to the provider selected by the user.
- The key is not saved to disk by v0.1.0.
- The repository and release APK do not contain a private API key.
- Requests remain subject to the selected provider's privacy policy, limits, and pricing.

Never commit an API key to the repository or share it in an issue, screenshot, or log.

## Installation

### Android APK

1. Open the [latest release](https://github.com/makecode91-ship-it/CodeMentor-/releases/latest).
2. Download `CodeMentor-v0.1.0-android.apk`.
3. Open the downloaded file on your Android device.
4. Allow installation from your browser or file manager if Android requests it.

v0.1.0 is an early GitHub preview signed with the Flutter development key. It is not a Google Play build.

SHA-256 for the v0.1.0 APK:

```text
1C767213670C8B36FA7620A900461280FAAE86D7D383D84D63CCEE25A5EF9494
```

### Run from source

Requirements:

- Flutter stable (v3.44.2 used for v0.1.0)
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
- `lib/shared/widgets`: reusable UI components
- `test`: parser and widget tests
- `android`: Android platform project

## Current limitations

- The interface is currently available in Polish only.
- The encyclopedia and quiz content are intentionally small in v0.1.0.
- Playground analyzes code but does not run it.
- API configuration is cleared when the app session ends.
- Android is the only published platform.
- The GitHub preview APK does not yet use a production signing key.

## Roadmap

- Expand encyclopedia lessons and examples
- Add quiz categories, levels, and a larger question database
- Add progress tracking, XP, streaks, and learning statistics
- Add beginner learning paths and programming challenges
- Add secure, opt-in API key persistence
- Add Polish and English localization
- Improve code formatting in AI responses
- Prepare Windows and Linux releases
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

[CodeMentor v0.1.0 release notes and APK](https://github.com/makecode91-ship-it/CodeMentor-/releases/tag/v0.1.0)

## License

CodeMentor is available under the [MIT License](LICENSE).

## Author

Created by **Make Code** as part of an effort to build practical open-source learning tools with Flutter and AI.
