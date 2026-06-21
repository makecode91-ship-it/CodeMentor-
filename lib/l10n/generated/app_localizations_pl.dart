// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'CodeMentor';

  @override
  String get chatPageTitle => 'Asystent AI';

  @override
  String get encyclopediaPageTitle => 'Encyklopedia';

  @override
  String get playgroundPageTitle => 'Playground';

  @override
  String get quizzesPageTitle => 'Quizy';

  @override
  String get settingsTooltip => 'Ustawienia';

  @override
  String get navHome => 'Start';

  @override
  String get navAi => 'AI';

  @override
  String get navWiki => 'Wiki';

  @override
  String get navCode => 'Kod';

  @override
  String get navQuizzes => 'Quizy';

  @override
  String get homeHeadline => 'Ucz się programowania przez praktykę';

  @override
  String get homeSubtitle =>
      'Pytaj, analizuj kod i sprawdzaj wiedzę w jednym miejscu.';

  @override
  String get toolsHeading => 'Narzędzia';

  @override
  String get assistantToolTitle => 'Asystent AI';

  @override
  String get assistantToolSubtitle => 'Rozwiązuj problemy';

  @override
  String get encyclopediaToolTitle => 'Encyklopedia';

  @override
  String get encyclopediaToolSubtitle => 'Poznawaj podstawy';

  @override
  String get playgroundToolTitle => 'Playground';

  @override
  String get playgroundToolSubtitle => 'Analizuj swój kod';

  @override
  String get quizzesToolTitle => 'Quizy';

  @override
  String get quizzesToolSubtitle => 'Sprawdzaj postępy';

  @override
  String get aiReady => 'AI jest gotowe';

  @override
  String get aiNeedsSetup => 'AI wymaga konfiguracji';

  @override
  String get addApiKey => 'Dodaj własny klucz API.';

  @override
  String get configureAi => 'Konfiguruj AI';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get settingsDescription =>
      'Dostosuj wygląd, język i połączenie z dostawcą AI.';

  @override
  String get appearanceLanguageHeading => 'Wygląd i język';

  @override
  String get languageLabel => 'Język aplikacji';

  @override
  String get polishLabel => 'Polski';

  @override
  String get englishLabel => 'English';

  @override
  String get themeLabel => 'Motyw';

  @override
  String get darkThemeLabel => 'Ciemny';

  @override
  String get lightThemeLabel => 'Jasny';

  @override
  String get preferencesSavedAutomatically =>
      'Zmiany języka i motywu są zapisywane automatycznie.';

  @override
  String get aiConnectionHeading => 'Połączenie z AI';

  @override
  String get sessionKeyNotice =>
      'Klucz API pozostaje wyłącznie w pamięci bieżącej sesji.';

  @override
  String get providerLabel => 'Dostawca';

  @override
  String get apiKeyLabel => 'Klucz API';

  @override
  String get showKeyTooltip => 'Pokaż klucz';

  @override
  String get hideKeyTooltip => 'Ukryj klucz';

  @override
  String get apiKeyRequired => 'Wklej klucz API.';

  @override
  String get modelLabel => 'Model';

  @override
  String get modelRequired => 'Wpisz nazwę modelu.';

  @override
  String get clearKey => 'Wyczyść klucz';

  @override
  String get saveAiSettings => 'Zapisz AI';

  @override
  String get close => 'Zamknij';

  @override
  String get configureAiBanner => 'Skonfiguruj dostawcę, klucz API i model.';

  @override
  String get openSettings => 'Ustawienia';

  @override
  String get noActiveModel => 'Brak aktywnego modelu';

  @override
  String get clearConversation => 'Wyczyść rozmowę';

  @override
  String get emptyChatTitle => 'Zadaj pierwsze pytanie';

  @override
  String get emptyChatSubtitle =>
      'Możesz poprosić o wyjaśnienie pojęcia, błędu lub fragmentu kodu.';

  @override
  String get copyResponse => 'Kopiuj odpowiedź';

  @override
  String get composerHint => 'Napisz pytanie o programowanie...';

  @override
  String get sendTooltip => 'Wyślij';

  @override
  String get unexpectedError =>
      'Wystąpił nieoczekiwany błąd. Spróbuj ponownie.';

  @override
  String get chatSystemPrompt =>
      'Jesteś cierpliwym mentorem programowania. Odpowiadaj po polsku, wyjaśniaj krok po kroku i dostosuj poziom do osoby początkującej. Kod umieszczaj w czytelnych blokach.';

  @override
  String get programmingLanguageLabel => 'Język';

  @override
  String get analyze => 'Analizuj';

  @override
  String get codeHint => 'Wpisz kod...';

  @override
  String get analysisPlaceholder => 'Tutaj pojawi się analiza kodu.';

  @override
  String get starterGreeting => 'Cześć';

  @override
  String playgroundUserPrompt(String language, String code) {
    return 'Język: $language\n\nKod:\n$code\n\nPrzeanalizuj kod, wskaż błędy i ryzyka, wyjaśnij działanie oraz pokaż poprawioną wersję, jeśli jest potrzebna.';
  }

  @override
  String get playgroundSystemPrompt =>
      'Jesteś mentorem programowania. Pisz po polsku i używaj prostych, konkretnych wyjaśnień. Nie wykonujesz kodu, tylko analizujesz go statycznie.';

  @override
  String get importantConcepts => 'Najważniejsze zagadnienia';

  @override
  String get exampleHeading => 'Przykład';

  @override
  String get pythonDescription =>
      'Czytelna składnia i dobry start w programowaniu.';

  @override
  String get pythonOverview =>
      'Python jest językiem ogólnego przeznaczenia. Sprawdza się w automatyzacji, analizie danych, backendzie i sztucznej inteligencji.';

  @override
  String get pythonConcept1 => 'Zmienne i typy danych';

  @override
  String get pythonConcept2 => 'Instrukcje warunkowe';

  @override
  String get pythonConcept3 => 'Pętle';

  @override
  String get pythonConcept4 => 'Funkcje';

  @override
  String get pythonConcept5 => 'Listy i słowniki';

  @override
  String get javascriptDescription =>
      'Podstawa interaktywnych aplikacji internetowych.';

  @override
  String get javascriptOverview =>
      'JavaScript działa w przeglądarce i na serwerze. Pozwala tworzyć strony, aplikacje webowe oraz backend z użyciem środowiska Node.js.';

  @override
  String get javascriptConcept1 => 'const i let';

  @override
  String get javascriptConcept2 => 'Funkcje';

  @override
  String get javascriptConcept3 => 'Tablice i obiekty';

  @override
  String get javascriptConcept4 => 'DOM';

  @override
  String get javascriptConcept5 => 'Kod asynchroniczny';

  @override
  String get cppDescription =>
      'Wydajność, kontrola pamięci i programowanie systemowe.';

  @override
  String get cppOverview =>
      'C++ daje dużą kontrolę nad zasobami komputera. Jest używany w silnikach gier, systemach, aplikacjach czasu rzeczywistego i narzędziach deweloperskich.';

  @override
  String get cppConcept1 => 'Typy statyczne';

  @override
  String get cppConcept2 => 'Referencje i wskaźniki';

  @override
  String get cppConcept3 => 'Klasy';

  @override
  String get cppConcept4 => 'STL';

  @override
  String get cppConcept5 => 'Zarządzanie zasobami';

  @override
  String get dartDescription =>
      'Nowoczesny język stojący za aplikacjami Flutter.';

  @override
  String get dartOverview =>
      'Dart łączy czytelną składnię, typowanie statyczne i wygodny model asynchroniczny. Flutter używa go do budowy aplikacji mobilnych, desktopowych i webowych.';

  @override
  String get dartConcept1 => 'Null safety';

  @override
  String get dartConcept2 => 'Klasy i rekordy';

  @override
  String get dartConcept3 => 'Kolekcje';

  @override
  String get dartConcept4 => 'Future i Stream';

  @override
  String get dartConcept5 => 'Widgety Flutter';

  @override
  String questionProgress(int current, int total) {
    return 'Pytanie $current z $total';
  }

  @override
  String scoreLabel(int score) {
    return 'Wynik: $score';
  }

  @override
  String get finishQuiz => 'Zakończ';

  @override
  String get nextQuestion => 'Dalej';

  @override
  String get quizCompleted => 'Quiz zakończony';

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String get quizQuestion1 => 'Co wypisze kod: print(2 + 2 * 3)?';

  @override
  String get quizQuestion1Answer1 => '12';

  @override
  String get quizQuestion1Answer2 => '8';

  @override
  String get quizQuestion1Answer3 => '10';

  @override
  String get quizQuestion1Answer4 => '6';

  @override
  String get quizQuestion2 =>
      'Które słowo kluczowe definiuje funkcję w Pythonie?';

  @override
  String get quizQuestion2Answer1 => 'func';

  @override
  String get quizQuestion2Answer2 => 'function';

  @override
  String get quizQuestion2Answer3 => 'def';

  @override
  String get quizQuestion2Answer4 => 'method';

  @override
  String get quizQuestion3 => 'Jaki typ ma wartość true w języku Dart?';

  @override
  String get quizQuestion3Answer1 => 'String';

  @override
  String get quizQuestion3Answer2 => 'bool';

  @override
  String get quizQuestion3Answer3 => 'int';

  @override
  String get quizQuestion3Answer4 => 'dynamic';

  @override
  String get quizQuestion4 => 'Co najczęściej oznacza HTTP 404?';

  @override
  String get quizQuestion4Answer1 => 'Brak autoryzacji';

  @override
  String get quizQuestion4Answer2 => 'Błąd serwera';

  @override
  String get quizQuestion4Answer3 => 'Nie znaleziono zasobu';

  @override
  String get quizQuestion4Answer4 => 'Sukces';

  @override
  String get quizQuestion5 =>
      'Która struktura powtarza kod, dopóki warunek jest spełniony?';

  @override
  String get quizQuestion5Answer1 => 'if';

  @override
  String get quizQuestion5Answer2 => 'class';

  @override
  String get quizQuestion5Answer3 => 'while';

  @override
  String get quizQuestion5Answer4 => 'import';

  @override
  String get configureApiKeyError => 'Najpierw skonfiguruj klucz API.';

  @override
  String get enterModelError => 'Wpisz nazwę modelu.';

  @override
  String get emptyMessageError => 'Wiadomość nie może być pusta.';

  @override
  String get providerTimeoutError =>
      'Dostawca nie odpowiedział w ciągu 90 sekund.';

  @override
  String connectionFailedError(String details) {
    return 'Nie udało się połączyć z dostawcą: $details';
  }

  @override
  String get emptyProviderResponseError => 'Dostawca zwrócił pustą odpowiedź.';

  @override
  String get unsupportedProviderError => 'Nieobsługiwany format dostawcy.';

  @override
  String get unknownResponseFormatError =>
      'Dostawca zwrócił odpowiedź w nieznanym formacie.';

  @override
  String get apiErrorLabel => 'Błąd API';
}
