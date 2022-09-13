import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_widget/scroll_widget.dart';

void main() {
  testWidgets(' Test Scrollable View', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
        ScrollWidget(list: List.generate(1000, (index) => 'item $index')));

    var scrollableFinder = find.byType(Scrollable);
    var item = find.byKey(const Key('item_500_txt'));

    await widgetTester.scrollUntilVisible(item, 500,
        scrollable: scrollableFinder);

    expect(item, findsOneWidget);
  });
}
