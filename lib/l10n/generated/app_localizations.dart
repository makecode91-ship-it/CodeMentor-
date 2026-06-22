import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// No description provided for @appTitle.
  ///
  /// In pl, this message translates to:
  /// **'CodeMentor'**
  String get appTitle;

  /// No description provided for @chatPageTitle.
  ///
  /// In pl, this message translates to:
  /// **'Asystent AI'**
  String get chatPageTitle;

  /// No description provided for @encyclopediaPageTitle.
  ///
  /// In pl, this message translates to:
  /// **'Encyklopedia'**
  String get encyclopediaPageTitle;

  /// No description provided for @playgroundPageTitle.
  ///
  /// In pl, this message translates to:
  /// **'Playground'**
  String get playgroundPageTitle;

  /// No description provided for @quizzesPageTitle.
  ///
  /// In pl, this message translates to:
  /// **'Quizy'**
  String get quizzesPageTitle;

  /// No description provided for @settingsTooltip.
  ///
  /// In pl, this message translates to:
  /// **'Ustawienia'**
  String get settingsTooltip;

  /// No description provided for @navHome.
  ///
  /// In pl, this message translates to:
  /// **'Start'**
  String get navHome;

  /// No description provided for @navAi.
  ///
  /// In pl, this message translates to:
  /// **'AI'**
  String get navAi;

  /// No description provided for @navWiki.
  ///
  /// In pl, this message translates to:
  /// **'Wiki'**
  String get navWiki;

  /// No description provided for @navCode.
  ///
  /// In pl, this message translates to:
  /// **'Kod'**
  String get navCode;

  /// No description provided for @navQuizzes.
  ///
  /// In pl, this message translates to:
  /// **'Quizy'**
  String get navQuizzes;

  /// No description provided for @homeHeadline.
  ///
  /// In pl, this message translates to:
  /// **'Ucz się programowania przez praktykę'**
  String get homeHeadline;

  /// No description provided for @homeSubtitle.
  ///
  /// In pl, this message translates to:
  /// **'Pytaj, analizuj kod i sprawdzaj wiedzę w jednym miejscu.'**
  String get homeSubtitle;

  /// No description provided for @toolsHeading.
  ///
  /// In pl, this message translates to:
  /// **'Narzędzia'**
  String get toolsHeading;

  /// No description provided for @assistantToolTitle.
  ///
  /// In pl, this message translates to:
  /// **'Asystent AI'**
  String get assistantToolTitle;

  /// No description provided for @assistantToolSubtitle.
  ///
  /// In pl, this message translates to:
  /// **'Rozwiązuj problemy'**
  String get assistantToolSubtitle;

  /// No description provided for @encyclopediaToolTitle.
  ///
  /// In pl, this message translates to:
  /// **'Encyklopedia'**
  String get encyclopediaToolTitle;

  /// No description provided for @encyclopediaToolSubtitle.
  ///
  /// In pl, this message translates to:
  /// **'Poznawaj podstawy'**
  String get encyclopediaToolSubtitle;

  /// No description provided for @playgroundToolTitle.
  ///
  /// In pl, this message translates to:
  /// **'Playground'**
  String get playgroundToolTitle;

  /// No description provided for @playgroundToolSubtitle.
  ///
  /// In pl, this message translates to:
  /// **'Analizuj swój kod'**
  String get playgroundToolSubtitle;

  /// No description provided for @quizzesToolTitle.
  ///
  /// In pl, this message translates to:
  /// **'Quizy'**
  String get quizzesToolTitle;

  /// No description provided for @quizzesToolSubtitle.
  ///
  /// In pl, this message translates to:
  /// **'Sprawdzaj postępy'**
  String get quizzesToolSubtitle;

  /// No description provided for @aiReady.
  ///
  /// In pl, this message translates to:
  /// **'AI jest gotowe'**
  String get aiReady;

  /// No description provided for @aiNeedsSetup.
  ///
  /// In pl, this message translates to:
  /// **'AI wymaga konfiguracji'**
  String get aiNeedsSetup;

  /// No description provided for @addApiKey.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj własny klucz API.'**
  String get addApiKey;

  /// No description provided for @configureAi.
  ///
  /// In pl, this message translates to:
  /// **'Konfiguruj AI'**
  String get configureAi;

  /// No description provided for @settingsTitle.
  ///
  /// In pl, this message translates to:
  /// **'Ustawienia'**
  String get settingsTitle;

  /// No description provided for @settingsDescription.
  ///
  /// In pl, this message translates to:
  /// **'Dostosuj wygląd, język i połączenie z dostawcą AI.'**
  String get settingsDescription;

  /// No description provided for @appearanceLanguageHeading.
  ///
  /// In pl, this message translates to:
  /// **'Wygląd i język'**
  String get appearanceLanguageHeading;

  /// No description provided for @languageLabel.
  ///
  /// In pl, this message translates to:
  /// **'Język aplikacji'**
  String get languageLabel;

  /// No description provided for @polishLabel.
  ///
  /// In pl, this message translates to:
  /// **'Polski'**
  String get polishLabel;

  /// No description provided for @englishLabel.
  ///
  /// In pl, this message translates to:
  /// **'English'**
  String get englishLabel;

  /// No description provided for @themeLabel.
  ///
  /// In pl, this message translates to:
  /// **'Motyw'**
  String get themeLabel;

  /// No description provided for @darkThemeLabel.
  ///
  /// In pl, this message translates to:
  /// **'Ciemny'**
  String get darkThemeLabel;

  /// No description provided for @lightThemeLabel.
  ///
  /// In pl, this message translates to:
  /// **'Jasny'**
  String get lightThemeLabel;

  /// No description provided for @preferencesSavedAutomatically.
  ///
  /// In pl, this message translates to:
  /// **'Zmiany języka i motywu są zapisywane automatycznie.'**
  String get preferencesSavedAutomatically;

  /// No description provided for @aiConnectionHeading.
  ///
  /// In pl, this message translates to:
  /// **'Połączenie z AI'**
  String get aiConnectionHeading;

  /// No description provided for @sessionKeyNotice.
  ///
  /// In pl, this message translates to:
  /// **'Klucz API pozostaje wyłącznie w pamięci bieżącej sesji.'**
  String get sessionKeyNotice;

  /// No description provided for @providerLabel.
  ///
  /// In pl, this message translates to:
  /// **'Dostawca'**
  String get providerLabel;

  /// No description provided for @apiKeyLabel.
  ///
  /// In pl, this message translates to:
  /// **'Klucz API'**
  String get apiKeyLabel;

  /// No description provided for @showKeyTooltip.
  ///
  /// In pl, this message translates to:
  /// **'Pokaż klucz'**
  String get showKeyTooltip;

  /// No description provided for @hideKeyTooltip.
  ///
  /// In pl, this message translates to:
  /// **'Ukryj klucz'**
  String get hideKeyTooltip;

  /// No description provided for @apiKeyRequired.
  ///
  /// In pl, this message translates to:
  /// **'Wklej klucz API.'**
  String get apiKeyRequired;

  /// No description provided for @modelLabel.
  ///
  /// In pl, this message translates to:
  /// **'Model'**
  String get modelLabel;

  /// No description provided for @modelRequired.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz nazwę modelu.'**
  String get modelRequired;

  /// No description provided for @clearKey.
  ///
  /// In pl, this message translates to:
  /// **'Wyczyść klucz'**
  String get clearKey;

  /// No description provided for @saveAiSettings.
  ///
  /// In pl, this message translates to:
  /// **'Zapisz AI'**
  String get saveAiSettings;

  /// No description provided for @close.
  ///
  /// In pl, this message translates to:
  /// **'Zamknij'**
  String get close;

  /// No description provided for @configureAiBanner.
  ///
  /// In pl, this message translates to:
  /// **'Skonfiguruj dostawcę, klucz API i model.'**
  String get configureAiBanner;

  /// No description provided for @openSettings.
  ///
  /// In pl, this message translates to:
  /// **'Ustawienia'**
  String get openSettings;

  /// No description provided for @noActiveModel.
  ///
  /// In pl, this message translates to:
  /// **'Brak aktywnego modelu'**
  String get noActiveModel;

  /// No description provided for @clearConversation.
  ///
  /// In pl, this message translates to:
  /// **'Wyczyść rozmowę'**
  String get clearConversation;

  /// No description provided for @emptyChatTitle.
  ///
  /// In pl, this message translates to:
  /// **'Zadaj pierwsze pytanie'**
  String get emptyChatTitle;

  /// No description provided for @emptyChatSubtitle.
  ///
  /// In pl, this message translates to:
  /// **'Możesz poprosić o wyjaśnienie pojęcia, błędu lub fragmentu kodu.'**
  String get emptyChatSubtitle;

  /// No description provided for @copyResponse.
  ///
  /// In pl, this message translates to:
  /// **'Kopiuj odpowiedź'**
  String get copyResponse;

  /// No description provided for @composerHint.
  ///
  /// In pl, this message translates to:
  /// **'Napisz pytanie o programowanie...'**
  String get composerHint;

  /// No description provided for @sendTooltip.
  ///
  /// In pl, this message translates to:
  /// **'Wyślij'**
  String get sendTooltip;

  /// No description provided for @unexpectedError.
  ///
  /// In pl, this message translates to:
  /// **'Wystąpił nieoczekiwany błąd. Spróbuj ponownie.'**
  String get unexpectedError;

  /// No description provided for @chatSystemPrompt.
  ///
  /// In pl, this message translates to:
  /// **'Jesteś cierpliwym mentorem programowania. Odpowiadaj po polsku, wyjaśniaj krok po kroku i dostosuj poziom do osoby początkującej. Kod umieszczaj w czytelnych blokach.'**
  String get chatSystemPrompt;

  /// No description provided for @programmingLanguageLabel.
  ///
  /// In pl, this message translates to:
  /// **'Język'**
  String get programmingLanguageLabel;

  /// No description provided for @analyze.
  ///
  /// In pl, this message translates to:
  /// **'Analizuj'**
  String get analyze;

  /// No description provided for @codeHint.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz kod...'**
  String get codeHint;

  /// No description provided for @analysisPlaceholder.
  ///
  /// In pl, this message translates to:
  /// **'Tutaj pojawi się analiza kodu.'**
  String get analysisPlaceholder;

  /// No description provided for @starterGreeting.
  ///
  /// In pl, this message translates to:
  /// **'Cześć'**
  String get starterGreeting;

  /// No description provided for @playgroundUserPrompt.
  ///
  /// In pl, this message translates to:
  /// **'Język: {language}\n\nKod:\n{code}\n\nPrzeanalizuj kod, wskaż błędy i ryzyka, wyjaśnij działanie oraz pokaż poprawioną wersję, jeśli jest potrzebna.'**
  String playgroundUserPrompt(String language, String code);

  /// No description provided for @playgroundSystemPrompt.
  ///
  /// In pl, this message translates to:
  /// **'Jesteś mentorem programowania. Pisz po polsku i używaj prostych, konkretnych wyjaśnień. Nie wykonujesz kodu, tylko analizujesz go statycznie.'**
  String get playgroundSystemPrompt;

  /// No description provided for @importantConcepts.
  ///
  /// In pl, this message translates to:
  /// **'Najważniejsze zagadnienia'**
  String get importantConcepts;

  /// No description provided for @exampleHeading.
  ///
  /// In pl, this message translates to:
  /// **'Przykład'**
  String get exampleHeading;

  /// No description provided for @pythonDescription.
  ///
  /// In pl, this message translates to:
  /// **'Czytelna składnia i dobry start w programowaniu.'**
  String get pythonDescription;

  /// No description provided for @pythonOverview.
  ///
  /// In pl, this message translates to:
  /// **'Python jest językiem ogólnego przeznaczenia. Sprawdza się w automatyzacji, analizie danych, backendzie i sztucznej inteligencji.'**
  String get pythonOverview;

  /// No description provided for @pythonConcept1.
  ///
  /// In pl, this message translates to:
  /// **'Zmienne i typy danych'**
  String get pythonConcept1;

  /// No description provided for @pythonConcept2.
  ///
  /// In pl, this message translates to:
  /// **'Instrukcje warunkowe'**
  String get pythonConcept2;

  /// No description provided for @pythonConcept3.
  ///
  /// In pl, this message translates to:
  /// **'Pętle'**
  String get pythonConcept3;

  /// No description provided for @pythonConcept4.
  ///
  /// In pl, this message translates to:
  /// **'Funkcje'**
  String get pythonConcept4;

  /// No description provided for @pythonConcept5.
  ///
  /// In pl, this message translates to:
  /// **'Listy i słowniki'**
  String get pythonConcept5;

  /// No description provided for @javascriptDescription.
  ///
  /// In pl, this message translates to:
  /// **'Podstawa interaktywnych aplikacji internetowych.'**
  String get javascriptDescription;

  /// No description provided for @javascriptOverview.
  ///
  /// In pl, this message translates to:
  /// **'JavaScript działa w przeglądarce i na serwerze. Pozwala tworzyć strony, aplikacje webowe oraz backend z użyciem środowiska Node.js.'**
  String get javascriptOverview;

  /// No description provided for @javascriptConcept1.
  ///
  /// In pl, this message translates to:
  /// **'const i let'**
  String get javascriptConcept1;

  /// No description provided for @javascriptConcept2.
  ///
  /// In pl, this message translates to:
  /// **'Funkcje'**
  String get javascriptConcept2;

  /// No description provided for @javascriptConcept3.
  ///
  /// In pl, this message translates to:
  /// **'Tablice i obiekty'**
  String get javascriptConcept3;

  /// No description provided for @javascriptConcept4.
  ///
  /// In pl, this message translates to:
  /// **'DOM'**
  String get javascriptConcept4;

  /// No description provided for @javascriptConcept5.
  ///
  /// In pl, this message translates to:
  /// **'Kod asynchroniczny'**
  String get javascriptConcept5;

  /// No description provided for @cppDescription.
  ///
  /// In pl, this message translates to:
  /// **'Wydajność, kontrola pamięci i programowanie systemowe.'**
  String get cppDescription;

  /// No description provided for @cppOverview.
  ///
  /// In pl, this message translates to:
  /// **'C++ daje dużą kontrolę nad zasobami komputera. Jest używany w silnikach gier, systemach, aplikacjach czasu rzeczywistego i narzędziach deweloperskich.'**
  String get cppOverview;

  /// No description provided for @cppConcept1.
  ///
  /// In pl, this message translates to:
  /// **'Typy statyczne'**
  String get cppConcept1;

  /// No description provided for @cppConcept2.
  ///
  /// In pl, this message translates to:
  /// **'Referencje i wskaźniki'**
  String get cppConcept2;

  /// No description provided for @cppConcept3.
  ///
  /// In pl, this message translates to:
  /// **'Klasy'**
  String get cppConcept3;

  /// No description provided for @cppConcept4.
  ///
  /// In pl, this message translates to:
  /// **'STL'**
  String get cppConcept4;

  /// No description provided for @cppConcept5.
  ///
  /// In pl, this message translates to:
  /// **'Zarządzanie zasobami'**
  String get cppConcept5;

  /// No description provided for @dartDescription.
  ///
  /// In pl, this message translates to:
  /// **'Nowoczesny język stojący za aplikacjami Flutter.'**
  String get dartDescription;

  /// No description provided for @dartOverview.
  ///
  /// In pl, this message translates to:
  /// **'Dart łączy czytelną składnię, typowanie statyczne i wygodny model asynchroniczny. Flutter używa go do budowy aplikacji mobilnych, desktopowych i webowych.'**
  String get dartOverview;

  /// No description provided for @dartConcept1.
  ///
  /// In pl, this message translates to:
  /// **'Null safety'**
  String get dartConcept1;

  /// No description provided for @dartConcept2.
  ///
  /// In pl, this message translates to:
  /// **'Klasy i rekordy'**
  String get dartConcept2;

  /// No description provided for @dartConcept3.
  ///
  /// In pl, this message translates to:
  /// **'Kolekcje'**
  String get dartConcept3;

  /// No description provided for @dartConcept4.
  ///
  /// In pl, this message translates to:
  /// **'Future i Stream'**
  String get dartConcept4;

  /// No description provided for @dartConcept5.
  ///
  /// In pl, this message translates to:
  /// **'Widgety Flutter'**
  String get dartConcept5;

  /// No description provided for @questionProgress.
  ///
  /// In pl, this message translates to:
  /// **'Pytanie {current} z {total}'**
  String questionProgress(int current, int total);

  /// No description provided for @scoreLabel.
  ///
  /// In pl, this message translates to:
  /// **'Wynik: {score}'**
  String scoreLabel(int score);

  /// No description provided for @finishQuiz.
  ///
  /// In pl, this message translates to:
  /// **'Zakończ'**
  String get finishQuiz;

  /// No description provided for @nextQuestion.
  ///
  /// In pl, this message translates to:
  /// **'Dalej'**
  String get nextQuestion;

  /// No description provided for @quizCompleted.
  ///
  /// In pl, this message translates to:
  /// **'Quiz zakończony'**
  String get quizCompleted;

  /// No description provided for @tryAgain.
  ///
  /// In pl, this message translates to:
  /// **'Spróbuj ponownie'**
  String get tryAgain;

  /// No description provided for @quizQuestion1.
  ///
  /// In pl, this message translates to:
  /// **'Co wypisze kod: print(2 + 2 * 3)?'**
  String get quizQuestion1;

  /// No description provided for @quizQuestion1Answer1.
  ///
  /// In pl, this message translates to:
  /// **'12'**
  String get quizQuestion1Answer1;

  /// No description provided for @quizQuestion1Answer2.
  ///
  /// In pl, this message translates to:
  /// **'8'**
  String get quizQuestion1Answer2;

  /// No description provided for @quizQuestion1Answer3.
  ///
  /// In pl, this message translates to:
  /// **'10'**
  String get quizQuestion1Answer3;

  /// No description provided for @quizQuestion1Answer4.
  ///
  /// In pl, this message translates to:
  /// **'6'**
  String get quizQuestion1Answer4;

  /// No description provided for @quizQuestion2.
  ///
  /// In pl, this message translates to:
  /// **'Które słowo kluczowe definiuje funkcję w Pythonie?'**
  String get quizQuestion2;

  /// No description provided for @quizQuestion2Answer1.
  ///
  /// In pl, this message translates to:
  /// **'func'**
  String get quizQuestion2Answer1;

  /// No description provided for @quizQuestion2Answer2.
  ///
  /// In pl, this message translates to:
  /// **'function'**
  String get quizQuestion2Answer2;

  /// No description provided for @quizQuestion2Answer3.
  ///
  /// In pl, this message translates to:
  /// **'def'**
  String get quizQuestion2Answer3;

  /// No description provided for @quizQuestion2Answer4.
  ///
  /// In pl, this message translates to:
  /// **'method'**
  String get quizQuestion2Answer4;

  /// No description provided for @quizQuestion3.
  ///
  /// In pl, this message translates to:
  /// **'Jaki typ ma wartość true w języku Dart?'**
  String get quizQuestion3;

  /// No description provided for @quizQuestion3Answer1.
  ///
  /// In pl, this message translates to:
  /// **'String'**
  String get quizQuestion3Answer1;

  /// No description provided for @quizQuestion3Answer2.
  ///
  /// In pl, this message translates to:
  /// **'bool'**
  String get quizQuestion3Answer2;

  /// No description provided for @quizQuestion3Answer3.
  ///
  /// In pl, this message translates to:
  /// **'int'**
  String get quizQuestion3Answer3;

  /// No description provided for @quizQuestion3Answer4.
  ///
  /// In pl, this message translates to:
  /// **'dynamic'**
  String get quizQuestion3Answer4;

  /// No description provided for @quizQuestion4.
  ///
  /// In pl, this message translates to:
  /// **'Co najczęściej oznacza HTTP 404?'**
  String get quizQuestion4;

  /// No description provided for @quizQuestion4Answer1.
  ///
  /// In pl, this message translates to:
  /// **'Brak autoryzacji'**
  String get quizQuestion4Answer1;

  /// No description provided for @quizQuestion4Answer2.
  ///
  /// In pl, this message translates to:
  /// **'Błąd serwera'**
  String get quizQuestion4Answer2;

  /// No description provided for @quizQuestion4Answer3.
  ///
  /// In pl, this message translates to:
  /// **'Nie znaleziono zasobu'**
  String get quizQuestion4Answer3;

  /// No description provided for @quizQuestion4Answer4.
  ///
  /// In pl, this message translates to:
  /// **'Sukces'**
  String get quizQuestion4Answer4;

  /// No description provided for @quizQuestion5.
  ///
  /// In pl, this message translates to:
  /// **'Która struktura powtarza kod, dopóki warunek jest spełniony?'**
  String get quizQuestion5;

  /// No description provided for @quizQuestion5Answer1.
  ///
  /// In pl, this message translates to:
  /// **'if'**
  String get quizQuestion5Answer1;

  /// No description provided for @quizQuestion5Answer2.
  ///
  /// In pl, this message translates to:
  /// **'class'**
  String get quizQuestion5Answer2;

  /// No description provided for @quizQuestion5Answer3.
  ///
  /// In pl, this message translates to:
  /// **'while'**
  String get quizQuestion5Answer3;

  /// No description provided for @quizQuestion5Answer4.
  ///
  /// In pl, this message translates to:
  /// **'import'**
  String get quizQuestion5Answer4;

  /// No description provided for @configureApiKeyError.
  ///
  /// In pl, this message translates to:
  /// **'Najpierw skonfiguruj klucz API.'**
  String get configureApiKeyError;

  /// No description provided for @enterModelError.
  ///
  /// In pl, this message translates to:
  /// **'Wpisz nazwę modelu.'**
  String get enterModelError;

  /// No description provided for @emptyMessageError.
  ///
  /// In pl, this message translates to:
  /// **'Wiadomość nie może być pusta.'**
  String get emptyMessageError;

  /// No description provided for @providerTimeoutError.
  ///
  /// In pl, this message translates to:
  /// **'Dostawca nie odpowiedział w ciągu 90 sekund.'**
  String get providerTimeoutError;

  /// No description provided for @connectionFailedError.
  ///
  /// In pl, this message translates to:
  /// **'Nie udało się połączyć z dostawcą: {details}'**
  String connectionFailedError(String details);

  /// No description provided for @emptyProviderResponseError.
  ///
  /// In pl, this message translates to:
  /// **'Dostawca zwrócił pustą odpowiedź.'**
  String get emptyProviderResponseError;

  /// No description provided for @unsupportedProviderError.
  ///
  /// In pl, this message translates to:
  /// **'Nieobsługiwany format dostawcy.'**
  String get unsupportedProviderError;

  /// No description provided for @unknownResponseFormatError.
  ///
  /// In pl, this message translates to:
  /// **'Dostawca zwrócił odpowiedź w nieznanym formacie.'**
  String get unknownResponseFormatError;

  /// No description provided for @apiErrorLabel.
  ///
  /// In pl, this message translates to:
  /// **'Błąd API'**
  String get apiErrorLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
