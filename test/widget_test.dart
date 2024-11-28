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

  // Тест на наявність тексту "IPZ-33: Vladyslav's last Flutter App"
  testWidgets('App displays correct text', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text("IPZ-33: Vladyslav's last Flutter App"), findsOneWidget);
  });

  // Тест на наявність FloatingActionButton з іконкою Icons.person
  testWidgets('FloatingActionButton has correct icon', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final iconFinder = find.byIcon(Icons.person);
    expect(iconFinder, findsOneWidget);
  });

  // Тест на правильне збільшення лічильника при натисканні кнопки
  testWidgets('Counter increments correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Counter value: 0'), findsOneWidget);

    // Натискаємо на кнопку
    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();

    expect(find.text('Counter value: 1'), findsOneWidget);
  });
}
