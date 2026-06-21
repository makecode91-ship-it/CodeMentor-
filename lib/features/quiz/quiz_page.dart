import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int? _selectedAnswer;
  int _score = 0;
  bool _finished = false;

  void _submitAnswer() {
    final selected = _selectedAnswer;
    if (selected == null) return;

    final questions = _questions(context.l10n);
    final correct = selected == questions[_questionIndex].correctIndex;
    if (_questionIndex == questions.length - 1) {
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
    final questions = _questions(context.l10n);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: _finished
              ? _Result(
                  score: _score,
                  total: questions.length,
                  onRestart: _restart,
                )
              : _buildQuiz(questions),
        ),
      ),
    );
  }

  Widget _buildQuiz(List<_QuizQuestion> questions) {
    final l10n = context.l10n;
    final question = questions[_questionIndex];
    final progress = (_questionIndex + 1) / questions.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(l10n.questionProgress(_questionIndex + 1, questions.length)),
            const Spacer(),
            Text(l10n.scoreLabel(_score)),
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
              _questionIndex == questions.length - 1
                  ? Icons.flag_outlined
                  : Icons.arrow_forward,
            ),
            label: Text(
              _questionIndex == questions.length - 1
                  ? l10n.finishQuiz
                  : l10n.nextQuestion,
            ),
          ),
        ),
      ],
    );
  }
}

class _Result extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRestart;

  const _Result({
    required this.score,
    required this.total,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
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
        Text(
          context.l10n.quizCompleted,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
          label: Text(context.l10n.tryAgain),
        ),
      ],
    );
  }
}

List<_QuizQuestion> _questions(AppLocalizations l10n) {
  return [
    _QuizQuestion(
      prompt: l10n.quizQuestion1,
      answers: [
        l10n.quizQuestion1Answer1,
        l10n.quizQuestion1Answer2,
        l10n.quizQuestion1Answer3,
        l10n.quizQuestion1Answer4,
      ],
      correctIndex: 1,
    ),
    _QuizQuestion(
      prompt: l10n.quizQuestion2,
      answers: [
        l10n.quizQuestion2Answer1,
        l10n.quizQuestion2Answer2,
        l10n.quizQuestion2Answer3,
        l10n.quizQuestion2Answer4,
      ],
      correctIndex: 2,
    ),
    _QuizQuestion(
      prompt: l10n.quizQuestion3,
      answers: [
        l10n.quizQuestion3Answer1,
        l10n.quizQuestion3Answer2,
        l10n.quizQuestion3Answer3,
        l10n.quizQuestion3Answer4,
      ],
      correctIndex: 1,
    ),
    _QuizQuestion(
      prompt: l10n.quizQuestion4,
      answers: [
        l10n.quizQuestion4Answer1,
        l10n.quizQuestion4Answer2,
        l10n.quizQuestion4Answer3,
        l10n.quizQuestion4Answer4,
      ],
      correctIndex: 2,
    ),
    _QuizQuestion(
      prompt: l10n.quizQuestion5,
      answers: [
        l10n.quizQuestion5Answer1,
        l10n.quizQuestion5Answer2,
        l10n.quizQuestion5Answer3,
        l10n.quizQuestion5Answer4,
      ],
      correctIndex: 2,
    ),
  ];
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
