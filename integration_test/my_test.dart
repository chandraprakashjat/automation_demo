import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_widget/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('My Integration Test', (WidgetTester widgetTester) async {
    app.main();

    await widgetTester.pumpAndSettle();

    var scrollableFinder = find.byType(Scrollable);
    var item = find.byKey(const Key('item_500_txt'));

    await binding.traceAction(() async {
      await widgetTester.scrollUntilVisible(item, 500,
          scrollable: scrollableFinder, maxScrolls: 1000);
    }, reportKey: 'scrolling_timeline');

    expect(find.text('Scroll Widget Test'), findsOneWidget);
  });
}
