import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_widget/my_widget.dart';

void main() {
  group('Goup widget Testing', () {
    testWidgets('Test My Widget ', (WidgetTester tester) async {
      // Build widget in test enviroment

      await tester.pumpWidget(const MyWidget(title: 'T', msg: 'M'));

      var titleFinder = find.text('T');
      var msgFinder = find.text('M');

      expect(titleFinder, findsOneWidget);
      expect(msgFinder, findsOneWidget);
    });

    testWidgets('By String of Widget', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Text('Hello'),
        ),
      ));

      var testFinder = find.text('Hello');
      expect(testFinder, findsOneWidget);
      expect(testFinder, findsNWidgets(1));
    });

    testWidgets('Find BY KEY', (widgetTester) async {
      await widgetTester.pumpWidget(MaterialApp(
        key: const Key(
          'key',
        ),
        home: Container(),
      ));

      expect(find.byKey(const Key('key')), findsOneWidget);
    });

    testWidgets('Find Widget by widgetInstance', (widgetTester) async {
      const widget = Text('Test');

      await widgetTester.pumpWidget(MaterialApp(
        home: Container(
          child: widget,
        ),
      ));

      expect(find.byWidget(widget), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });
  });
}
