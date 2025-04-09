import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/main.dart';

void main() {
  testWidgets('Start screen loads and Start Quiz button appears',
      (WidgetTester tester) async {
    // Build your app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Check if the "Start Quiz" button is found
    expect(find.text('Start Quiz'), findsOneWidget);

    // Tap the "Start Quiz" button
    await tester.tap(find.text('Start Quiz'));
    await tester.pump();

    // After tapping, we expect the first question to show (or any other widget that should appear)
    // You can update this line to match something on the questions screen
    expect(find.textContaining('?'), findsWidgets); // Rough check for questions
  });
}
