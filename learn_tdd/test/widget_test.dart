// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

int calculate(int a, int b) {
  if (a == b) return a + b;
  throw Exception();
}

void main() {
  test('Testing Function Calculate', () {
    expect(calculate(1, 1), 2);
    expect(calculate(2, 2), 4);
    expect(() => calculate(1, 2), throwsA(isA<Exception>()));
  });
}
