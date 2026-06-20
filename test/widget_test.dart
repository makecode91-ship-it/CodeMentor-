import 'package:codementor/app/codementor_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('wyświetla ekran startowy CodeMentor', (tester) async {
    await tester.pumpWidget(const CodeMentorApp());
    await tester.pump();

    expect(find.text('CodeMentor'), findsOneWidget);
    expect(find.text('Ucz się programowania przez praktykę'), findsOneWidget);
    expect(find.text('Start'), findsOneWidget);
  });
}
