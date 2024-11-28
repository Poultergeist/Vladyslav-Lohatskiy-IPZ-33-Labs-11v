import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab/calculator.dart';
import 'package:lab/main.dart';

void main() {
  // Тест на правильність розрахунку функції
  test('Function calculation test', () {
    final calculator = Calculator();
    expect(calculator.calculate(2), closeTo(0.625, 0.001)); // 5*2 / (4*2^2) = 0.625
  });

  testWidgets('App displays correct text', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text("IPZ-33: Vladyslav's last Flutter App"), findsOneWidget);
  });

  testWidgets('FloatingActionButton has correct icon', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final iconFinder = find.byIcon(Icons.pets);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('Counter increments correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Counter value: 0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.pets));
    await tester.pump();

    expect(find.text('Counter value: 4'), findsOneWidget);
  });
}
