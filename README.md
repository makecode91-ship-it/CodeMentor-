# CodeMentor

CodeMentor is an open-source Flutter application designed to help beginners learn programming more effectively.

It combines an AI chat, a programming encyclopedia, a code playground, and quizzes in one simple learning app. The goal of CodeMentor is to make programming practice easier, more interactive, and more accessible for learners.

> Current version: **v0.1.0**
> Platform: **Android**
> Tested on: **Android 15**

## Features

### AI Chat

CodeMentor includes an optional AI chat feature that can help users understand programming concepts, explain code, and answer coding-related questions.

The app does not include any built-in paid API keys. Users need to provide their own API key, for example from OpenRouter or another supported AI provider.

AI can be used for:

* Explaining programming concepts
* Helping understand errors
* Reviewing code
* Giving learning hints
* Answering beginner programming questions

### Programming Encyclopedia

CodeMentor includes a small programming encyclopedia with basic information about programming languages.

In version `0.1.0`, the encyclopedia contains basic content for 4 programming languages. The descriptions are currently short, but this section will be expanded over time with more languages, examples, explanations, and beginner-friendly learning material.

### Playground

The Playground is a place where users can write code and check its correctness.

The goal of this feature is to help beginners practice programming, experiment with code, understand mistakes, and improve their skills through hands-on learning.

### Quizzes

CodeMentor includes programming quizzes that help users test their knowledge.

The current version includes a small number of questions, but more quizzes, categories, and difficulty levels will be added in future releases.

## Version 0.1.0

This is the first public release of CodeMentor.

### Included in v0.1.0

* AI Chat with user-provided API key
* Programming language encyclopedia
* Code playground
* Programming quizzes
* Android support
* Tested on Android 15

### Current limitations

CodeMentor is still in early development. Some features are simple and will be improved in future versions.

Current limitations:

* The encyclopedia content is short
* The quiz database is small
* The playground is still basic
* AI requires the user's own API key
* Desktop support is planned but not fully released yet

## Platform Support

Currently supported:

* Android

Tested on:

* Android 15

Planned support:

* Windows desktop
* More Android improvements
* Possibly web support in the future

## Tech Stack

* Flutter
* Dart
* Optional AI API integration

## Installation

### From source

To run CodeMentor locally, make sure you have Flutter installed.

```bash
git clone https://github.com/YOUR_USERNAME/CodeMentor.git
cd CodeMentor
flutter pub get
flutter run
```

Replace `YOUR_USERNAME` with your GitHub username.

### Android build

To build an Android APK:

```bash
flutter build apk
```

The generated APK will be available in:

```txt
build/app/outputs/flutter-apk/
```

## AI Setup

CodeMentor does not include any built-in API keys.

To use AI features, users need to provide their own API key from a supported provider, such as OpenRouter or another compatible AI API provider.

This makes the app safer for open-source use because the project does not depend on a private built-in API key.

Recommended AI setup:

1. Create an API key from your chosen provider.
2. Open CodeMentor.
3. Go to the AI settings section.
4. Paste your API key.
5. Select or enter the model you want to use.
6. Start using the AI Chat or code analysis features.

## Roadmap

Planned improvements for future versions:

* Add more programming languages to the encyclopedia
* Add better explanations and code examples
* Add more quiz questions
* Add quiz categories and difficulty levels
* Improve the code playground
* Add better AI provider settings
* Improve API key handling
* Add progress tracking
* Add XP, streaks, and learning statistics
* Add beginner learning paths
* Add more programming challenges
* Improve the Android UI
* Add desktop version
* Add screenshots and demo assets
* Improve documentation

## Project Status

CodeMentor is currently in early development.

The first goal is to build a clean and useful open-source learning app for Android and desktop. Version `0.1.0` is the first public release and provides the foundation for future improvements.

## Contributing

Contributions are welcome.

You can help by:

* Adding new quiz questions
* Improving encyclopedia content
* Fixing bugs
* Improving the Flutter UI
* Adding new programming lessons
* Improving the playground
* Improving AI provider support
* Writing documentation
* Testing the app on different Android devices

If you want to contribute, feel free to open an issue or submit a pull request.

## Ideas for Contributors

Good first contribution ideas:

* Add a new programming language to the encyclopedia
* Add 5 new quiz questions
* Improve one existing language description
* Fix a UI issue
* Improve README documentation
* Add screenshots
* Test the app on a new Android version

## License

CodeMentor is open-source and available under the MIT License.

## Author

Created by Make Code.

CodeMentor is part of a larger effort to build useful learning tools with Flutter, AI, and open-source technology.
