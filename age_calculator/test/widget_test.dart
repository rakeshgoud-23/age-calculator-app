import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:age_calculator/main.dart';

void main() {
  testWidgets('Age calculator opens', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AgeCalculator()));
    expect(find.text('Select Date of Birth'), findsOneWidget);
  });
}
