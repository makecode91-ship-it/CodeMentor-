import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  static const _questions = [
    _QuizQuestion(
      prompt: 'Co wypisze kod: print(2 + 2 * 3)?',
      answers: ['12', '8', '10', '6'],
      correctIndex: 1,
    ),
    _QuizQuestion(
      prompt: 'Które słowo kluczowe definiuje funkcję w Pythonie?',
      answers: ['func', 'function', 'def', 'method'],
      correctIndex: 2,
    ),
    _QuizQuestion(
      prompt: 'Jaki typ ma wartość true w języku Dart?',
      answers: ['String', 'bool', 'int', 'dynamic'],
      correctIndex: 1,
    ),
    _QuizQuestion(
      prompt: 'Co najczęściej oznacza HTTP 404?',
      answers: [
        'Brak autoryzacji',
        'Błąd serwera',
        'Nie znaleziono zasobu',
        'Sukces'
      ],
      correctIndex: 2,
    ),
    _QuizQuestion(
      prompt: 'Która struktura powtarza kod, dopóki warunek jest spełniony?',
      answers: ['if', 'class', 'while', 'import'],
      correctIndex: 2,
    ),
  ];

  int _questionIndex = 0;
  int? _selectedAnswer;
  int _score = 0;
  bool _finished = false;

  void _submitAnswer() {
    final selected = _selectedAnswer;
    if (selected == null) return;

    final correct = selected == _questions[_questionIndex].correctIndex;
    if (_questionIndex == _questions.length - 1) {
      setState(() {
        if (correct) _score++;
        _finished = true;
      });
      return;
    }

    setState(() {
      if (correct) _score++;
      _questionIndex++;
      _selectedAnswer = null;
    });
  }

  void _restart() {
    setState(() {
      _questionIndex = 0;
      _selectedAnswer = null;
      _score = 0;
      _finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: _finished
              ? _Result(score: _score, onRestart: _restart)
              : _buildQuiz(),
        ),
      ),
    );
  }

  Widget _buildQuiz() {
    final question = _questions[_questionIndex];
    final progress = (_questionIndex + 1) / _questions.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text('Pytanie ${_questionIndex + 1} z ${_questions.length}'),
            const Spacer(),
            Text('Wynik: $_score'),
          ],
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: progress, minHeight: 6),
        const SizedBox(height: 24),
        Text(
          question.prompt,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: RadioGroup<int>(
            groupValue: _selectedAnswer,
            onChanged: (value) => setState(() => _selectedAnswer = value),
            child: ListView.separated(
              itemCount: question.answers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => Material(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(8),
                child: RadioListTile<int>(
                  value: index,
                  title: Text(question.answers[index]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton.icon(
            onPressed: _selectedAnswer == null ? null : _submitAnswer,
            icon: Icon(
              _questionIndex == _questions.length - 1
                  ? Icons.flag_outlined
                  : Icons.arrow_forward,
            ),
            label: Text(
              _questionIndex == _questions.length - 1 ? 'Zakończ' : 'Dalej',
            ),
          ),
        ),
      ],
    );
  }
}

class _Result extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;

  const _Result({required this.score, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    final total = _QuizPageState._questions.length;
    final percentage = (score / total * 100).round();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          percentage >= 60
              ? Icons.emoji_events_outlined
              : Icons.school_outlined,
          size: 56,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(height: 18),
        const Text(
          'Quiz zakończony',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '$score / $total · $percentage%',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: onRestart,
          icon: const Icon(Icons.refresh),
          label: const Text('Spróbuj ponownie'),
        ),
      ],
    );
  }
}

class _QuizQuestion {
  final String prompt;
  final List<String> answers;
  final int correctIndex;

  const _QuizQuestion({
    required this.prompt,
    required this.answers,
    required this.correctIndex,
  });
}
