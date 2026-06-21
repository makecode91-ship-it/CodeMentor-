import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';

class EncyclopediaPage extends StatelessWidget {
  const EncyclopediaPage({super.key});

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
              itemCount: _TopicId.values.length,
              itemBuilder: (context, index) => _TopicTile(
                topicId: _TopicId.values[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TopicTile extends StatelessWidget {
  final _TopicId topicId;

  const _TopicTile({required this.topicId});

  @override
  Widget build(BuildContext context) {
    final topic = topicId.data(context);
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => _LanguageDetailPage(topicId: topicId),
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
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
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
  final _TopicId topicId;

  const _LanguageDetailPage({required this.topicId});

  @override
  Widget build(BuildContext context) {
    final topic = topicId.data(context);
    final colors = Theme.of(context).colorScheme;

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
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                topic.overview,
                style: const TextStyle(fontSize: 16, height: 1.55),
              ),
              const SizedBox(height: 28),
              Text(
                context.l10n.importantConcepts,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ...topic.concepts.map(
                (concept) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 19,
                        color: topic.color,
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(concept)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                context.l10n.exampleHeading,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: SelectableText(
                  topic.sampleCode,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    height: 1.45,
                    color: colors.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _TopicId {
  python,
  javascript,
  cpp,
  dart;

  _LanguageTopic data(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return switch (this) {
      _TopicId.python => _LanguageTopic(
          name: 'Python',
          description: l10n.pythonDescription,
          icon: Icons.terminal,
          color: colors.primary,
          overview: l10n.pythonOverview,
          concepts: [
            l10n.pythonConcept1,
            l10n.pythonConcept2,
            l10n.pythonConcept3,
            l10n.pythonConcept4,
            l10n.pythonConcept5,
          ],
          sampleCode:
              'def average(numbers):\n    return sum(numbers) / len(numbers)\n\nscores = [8, 9, 10]\nprint(average(scores))',
        ),
      _TopicId.javascript => _LanguageTopic(
          name: 'JavaScript',
          description: l10n.javascriptDescription,
          icon: Icons.language,
          color: colors.secondary,
          overview: l10n.javascriptOverview,
          concepts: [
            l10n.javascriptConcept1,
            l10n.javascriptConcept2,
            l10n.javascriptConcept3,
            l10n.javascriptConcept4,
            l10n.javascriptConcept5,
          ],
          sampleCode:
              'const scores = [8, 9, 10];\nconst average = scores.reduce((sum, score) => sum + score, 0) / scores.length;\nconsole.log(average);',
        ),
      _TopicId.cpp => _LanguageTopic(
          name: 'C++',
          description: l10n.cppDescription,
          icon: Icons.memory,
          color: isDark ? const Color(0xFF8CB4FF) : const Color(0xFF315A9B),
          overview: l10n.cppOverview,
          concepts: [
            l10n.cppConcept1,
            l10n.cppConcept2,
            l10n.cppConcept3,
            l10n.cppConcept4,
            l10n.cppConcept5,
          ],
          sampleCode:
              '#include <iostream>\n#include <vector>\n\nint main() {\n  std::vector<int> scores{8, 9, 10};\n  for (int score : scores) std::cout << score << "\\n";\n}',
        ),
      _TopicId.dart => _LanguageTopic(
          name: 'Dart',
          description: l10n.dartDescription,
          icon: Icons.flutter_dash,
          color: isDark ? const Color(0xFFE49BFF) : const Color(0xFF7C3B90),
          overview: l10n.dartOverview,
          concepts: [
            l10n.dartConcept1,
            l10n.dartConcept2,
            l10n.dartConcept3,
            l10n.dartConcept4,
            l10n.dartConcept5,
          ],
          sampleCode:
              'double average(List<int> numbers) {\n  final sum = numbers.reduce((a, b) => a + b);\n  return sum / numbers.length;\n}\n\nvoid main() => print(average([8, 9, 10]));',
        ),
    };
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
