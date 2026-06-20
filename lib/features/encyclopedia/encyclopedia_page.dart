import 'package:flutter/material.dart';

class EncyclopediaPage extends StatelessWidget {
  const EncyclopediaPage({super.key});

  static const _topics = [
    _LanguageTopic(
      name: 'Python',
      description: 'Czytelna składnia i dobry start w programowaniu.',
      icon: Icons.terminal,
      color: Color(0xFF5FD4C7),
      overview:
          'Python jest językiem ogólnego przeznaczenia. Sprawdza się w automatyzacji, analizie danych, backendzie i sztucznej inteligencji.',
      concepts: [
        'Zmienne i typy danych',
        'Instrukcje warunkowe',
        'Pętle',
        'Funkcje',
        'Listy i słowniki'
      ],
      sampleCode:
          'def average(numbers):\n    return sum(numbers) / len(numbers)\n\nscores = [8, 9, 10]\nprint(average(scores))',
    ),
    _LanguageTopic(
      name: 'JavaScript',
      description: 'Podstawa interaktywnych aplikacji internetowych.',
      icon: Icons.language,
      color: Color(0xFFFFC857),
      overview:
          'JavaScript działa w przeglądarce i na serwerze. Pozwala tworzyć strony, aplikacje webowe oraz backend z użyciem środowiska Node.js.',
      concepts: [
        'const i let',
        'Funkcje',
        'Tablice i obiekty',
        'DOM',
        'Kod asynchroniczny'
      ],
      sampleCode:
          'const scores = [8, 9, 10];\nconst average = scores.reduce((sum, score) => sum + score, 0) / scores.length;\nconsole.log(average);',
    ),
    _LanguageTopic(
      name: 'C++',
      description: 'Wydajność, kontrola pamięci i programowanie systemowe.',
      icon: Icons.memory,
      color: Color(0xFF8CB4FF),
      overview:
          'C++ daje dużą kontrolę nad zasobami komputera. Jest używany w silnikach gier, systemach, aplikacjach czasu rzeczywistego i narzędziach deweloperskich.',
      concepts: [
        'Typy statyczne',
        'Referencje i wskaźniki',
        'Klasy',
        'STL',
        'Zarządzanie zasobami'
      ],
      sampleCode:
          '#include <iostream>\n#include <vector>\n\nint main() {\n  std::vector<int> scores{8, 9, 10};\n  for (int score : scores) std::cout << score << "\\n";\n}',
    ),
    _LanguageTopic(
      name: 'Dart',
      description: 'Nowoczesny język stojący za aplikacjami Flutter.',
      icon: Icons.flutter_dash,
      color: Color(0xFFE49BFF),
      overview:
          'Dart łączy czytelną składnię, typowanie statyczne i wygodny model asynchroniczny. Flutter używa go do budowy aplikacji mobilnych, desktopowych i webowych.',
      concepts: [
        'Null safety',
        'Klasy i rekordy',
        'Kolekcje',
        'Future i Stream',
        'Widgety Flutter'
      ],
      sampleCode:
          'double average(List<int> numbers) {\n  final sum = numbers.reduce((a, b) => a + b);\n  return sum / numbers.length;\n}\n\nvoid main() => print(average([8, 9, 10]));',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 760 ? 2 : 1;
            return GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: columns == 2 ? 2.4 : 2.15,
              ),
              itemCount: _topics.length,
              itemBuilder: (context, index) =>
                  _TopicTile(topic: _topics[index]),
            );
          },
        ),
      ),
    );
  }
}

class _TopicTile extends StatelessWidget {
  final _LanguageTopic topic;

  const _TopicTile({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => _LanguageDetailPage(topic: topic),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Icon(topic.icon, size: 34, color: topic.color),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.name,
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      topic.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageDetailPage extends StatelessWidget {
  final _LanguageTopic topic;

  const _LanguageDetailPage({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(topic.name)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                children: [
                  Icon(topic.icon, size: 42, color: topic.color),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      topic.description,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(topic.overview,
                  style: const TextStyle(fontSize: 16, height: 1.55)),
              const SizedBox(height: 28),
              const Text(
                'Najważniejsze zagadnienia',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...topic.concepts.map(
                (concept) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline,
                          size: 19, color: topic.color),
                      const SizedBox(width: 10),
                      Expanded(child: Text(concept)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Przykład',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0B0E11),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: SelectableText(
                  topic.sampleCode,
                  style: const TextStyle(fontFamily: 'monospace', height: 1.45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageTopic {
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final String overview;
  final List<String> concepts;
  final String sampleCode;

  const _LanguageTopic({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.overview,
    required this.concepts,
    required this.sampleCode,
  });
}
