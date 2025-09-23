// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:mini_proyecto/main.dart';

void main() {
  testWidgets('BMI Calculator app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BMICalculatorApp());

    // Verify that the splash screen appears
    expect(find.text('Calculadora de IMC'), findsOneWidget);
    expect(find.text('Calcula tu Índice de Masa Corporal'), findsOneWidget);
  });
}
