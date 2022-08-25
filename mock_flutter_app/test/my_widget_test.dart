//create widget testing
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_flutter_app/my_widget.dart';

void main() {
  group('Testing WIdget', () {
    testWidgets('MyWidget has a title and message',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyWidget(title: 'Hello', message: 'World'));
      // Create the Finders.
      final titleFinder = find.text('Hello');
      final messageFinder = find.text('World');
      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });
    testWidgets('find widget text', (WidgetTester tester) async {
      await tester.pumpWidget(const MyWidget(title: 'Hello', message: 'World'));
      expect(find.byType(Center), findsWidgets);
    });
  });
}
