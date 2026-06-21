// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CodeMentor';

  @override
  String get chatPageTitle => 'AI Assistant';

  @override
  String get encyclopediaPageTitle => 'Encyclopedia';

  @override
  String get playgroundPageTitle => 'Playground';

  @override
  String get quizzesPageTitle => 'Quizzes';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get navHome => 'Home';

  @override
  String get navAi => 'AI';

  @override
  String get navWiki => 'Wiki';

  @override
  String get navCode => 'Code';

  @override
  String get navQuizzes => 'Quizzes';

  @override
  String get homeHeadline => 'Learn programming through practice';

  @override
  String get homeSubtitle =>
      'Ask questions, analyze code, and test your knowledge in one place.';

  @override
  String get toolsHeading => 'Tools';

  @override
  String get assistantToolTitle => 'AI Assistant';

  @override
  String get assistantToolSubtitle => 'Solve problems';

  @override
  String get encyclopediaToolTitle => 'Encyclopedia';

  @override
  String get encyclopediaToolSubtitle => 'Learn the basics';

  @override
  String get playgroundToolTitle => 'Playground';

  @override
  String get playgroundToolSubtitle => 'Analyze your code';

  @override
  String get quizzesToolTitle => 'Quizzes';

  @override
  String get quizzesToolSubtitle => 'Check your progress';

  @override
  String get aiReady => 'AI is ready';

  @override
  String get aiNeedsSetup => 'AI needs configuration';

  @override
  String get addApiKey => 'Add your own API key.';

  @override
  String get configureAi => 'Configure AI';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsDescription =>
      'Customize the appearance, language, and AI provider connection.';

  @override
  String get appearanceLanguageHeading => 'Appearance and language';

  @override
  String get languageLabel => 'App language';

  @override
  String get polishLabel => 'Polski';

  @override
  String get englishLabel => 'English';

  @override
  String get themeLabel => 'Theme';

  @override
  String get darkThemeLabel => 'Dark';

  @override
  String get lightThemeLabel => 'Light';

  @override
  String get preferencesSavedAutomatically =>
      'Language and theme changes are saved automatically.';

  @override
  String get aiConnectionHeading => 'AI connection';

  @override
  String get sessionKeyNotice =>
      'Your API key remains only in memory for the current session.';

  @override
  String get providerLabel => 'Provider';

  @override
  String get apiKeyLabel => 'API key';

  @override
  String get showKeyTooltip => 'Show key';

  @override
  String get hideKeyTooltip => 'Hide key';

  @override
  String get apiKeyRequired => 'Paste an API key.';

  @override
  String get modelLabel => 'Model';

  @override
  String get modelRequired => 'Enter a model name.';

  @override
  String get clearKey => 'Clear key';

  @override
  String get saveAiSettings => 'Save AI';

  @override
  String get close => 'Close';

  @override
  String get configureAiBanner => 'Configure a provider, API key, and model.';

  @override
  String get openSettings => 'Settings';

  @override
  String get noActiveModel => 'No active model';

  @override
  String get clearConversation => 'Clear conversation';

  @override
  String get emptyChatTitle => 'Ask your first question';

  @override
  String get emptyChatSubtitle =>
      'Ask for an explanation of a concept, error, or code snippet.';

  @override
  String get copyResponse => 'Copy response';

  @override
  String get composerHint => 'Ask a programming question...';

  @override
  String get sendTooltip => 'Send';

  @override
  String get unexpectedError =>
      'An unexpected error occurred. Please try again.';

  @override
  String get chatSystemPrompt =>
      'You are a patient programming mentor. Reply in English, explain step by step, and adapt your answers for a beginner. Put code in clear code blocks.';

  @override
  String get programmingLanguageLabel => 'Language';

  @override
  String get analyze => 'Analyze';

  @override
  String get codeHint => 'Enter code...';

  @override
  String get analysisPlaceholder => 'Your code analysis will appear here.';

  @override
  String get starterGreeting => 'Hello';

  @override
  String playgroundUserPrompt(String language, String code) {
    return 'Language: $language\n\nCode:\n$code\n\nAnalyze the code, identify errors and risks, explain how it works, and show a corrected version if needed.';
  }

  @override
  String get playgroundSystemPrompt =>
      'You are a programming mentor. Reply in English with simple, concrete explanations. You do not execute code; you only analyze it statically.';

  @override
  String get importantConcepts => 'Key concepts';

  @override
  String get exampleHeading => 'Example';

  @override
  String get pythonDescription =>
      'Readable syntax and a friendly start in programming.';

  @override
  String get pythonOverview =>
      'Python is a general-purpose language used in automation, data analysis, backend development, and artificial intelligence.';

  @override
  String get pythonConcept1 => 'Variables and data types';

  @override
  String get pythonConcept2 => 'Conditional statements';

  @override
  String get pythonConcept3 => 'Loops';

  @override
  String get pythonConcept4 => 'Functions';

  @override
  String get pythonConcept5 => 'Lists and dictionaries';

  @override
  String get javascriptDescription =>
      'The foundation of interactive web applications.';

  @override
  String get javascriptOverview =>
      'JavaScript runs in browsers and on servers. It is used to build websites, web applications, and backends with Node.js.';

  @override
  String get javascriptConcept1 => 'const and let';

  @override
  String get javascriptConcept2 => 'Functions';

  @override
  String get javascriptConcept3 => 'Arrays and objects';

  @override
  String get javascriptConcept4 => 'DOM';

  @override
  String get javascriptConcept5 => 'Asynchronous code';

  @override
  String get cppDescription =>
      'Performance, memory control, and systems programming.';

  @override
  String get cppOverview =>
      'C++ provides extensive control over computer resources. It is used in game engines, systems, real-time applications, and developer tools.';

  @override
  String get cppConcept1 => 'Static types';

  @override
  String get cppConcept2 => 'References and pointers';

  @override
  String get cppConcept3 => 'Classes';

  @override
  String get cppConcept4 => 'STL';

  @override
  String get cppConcept5 => 'Resource management';

  @override
  String get dartDescription =>
      'The modern language behind Flutter applications.';

  @override
  String get dartOverview =>
      'Dart combines readable syntax, static typing, and a convenient asynchronous model. Flutter uses it to build mobile, desktop, and web applications.';

  @override
  String get dartConcept1 => 'Null safety';

  @override
  String get dartConcept2 => 'Classes and records';

  @override
  String get dartConcept3 => 'Collections';

  @override
  String get dartConcept4 => 'Future and Stream';

  @override
  String get dartConcept5 => 'Flutter widgets';

  @override
  String questionProgress(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String scoreLabel(int score) {
    return 'Score: $score';
  }

  @override
  String get finishQuiz => 'Finish';

  @override
  String get nextQuestion => 'Next';

  @override
  String get quizCompleted => 'Quiz completed';

  @override
  String get tryAgain => 'Try again';

  @override
  String get quizQuestion1 => 'What does this code print: print(2 + 2 * 3)?';

  @override
  String get quizQuestion1Answer1 => '12';

  @override
  String get quizQuestion1Answer2 => '8';

  @override
  String get quizQuestion1Answer3 => '10';

  @override
  String get quizQuestion1Answer4 => '6';

  @override
  String get quizQuestion2 => 'Which keyword defines a function in Python?';

  @override
  String get quizQuestion2Answer1 => 'func';

  @override
  String get quizQuestion2Answer2 => 'function';

  @override
  String get quizQuestion2Answer3 => 'def';

  @override
  String get quizQuestion2Answer4 => 'method';

  @override
  String get quizQuestion3 => 'What type does the value true have in Dart?';

  @override
  String get quizQuestion3Answer1 => 'String';

  @override
  String get quizQuestion3Answer2 => 'bool';

  @override
  String get quizQuestion3Answer3 => 'int';

  @override
  String get quizQuestion3Answer4 => 'dynamic';

  @override
  String get quizQuestion4 => 'What does HTTP 404 usually mean?';

  @override
  String get quizQuestion4Answer1 => 'Unauthorized';

  @override
  String get quizQuestion4Answer2 => 'Server error';

  @override
  String get quizQuestion4Answer3 => 'Resource not found';

  @override
  String get quizQuestion4Answer4 => 'Success';

  @override
  String get quizQuestion5 =>
      'Which structure repeats code while a condition remains true?';

  @override
  String get quizQuestion5Answer1 => 'if';

  @override
  String get quizQuestion5Answer2 => 'class';

  @override
  String get quizQuestion5Answer3 => 'while';

  @override
  String get quizQuestion5Answer4 => 'import';

  @override
  String get configureApiKeyError => 'Configure an API key first.';

  @override
  String get enterModelError => 'Enter a model name.';

  @override
  String get emptyMessageError => 'The message cannot be empty.';

  @override
  String get providerTimeoutError =>
      'The provider did not respond within 90 seconds.';

  @override
  String connectionFailedError(String details) {
    return 'Could not connect to the provider: $details';
  }

  @override
  String get emptyProviderResponseError =>
      'The provider returned an empty response.';

  @override
  String get unsupportedProviderError => 'Unsupported provider format.';

  @override
  String get unknownResponseFormatError =>
      'The provider returned an unknown response format.';

  @override
  String get apiErrorLabel => 'API error';
}
