import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_widget/todo_list.dart';

void main() {
  testWidgets('Testing functinality off todo list',
      (WidgetTester tester) async {
    //load widget

    await tester.pumpWidget(const TodoListWidget());

    var textField = find.byType(TextField);
    var button = find.byKey(const Key('float_action'));

    await tester.enterText(textField, 'Prakash');

    await tester.tap(button);

    await tester.pump();

    expect(find.text('Prakash'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), const Offset(500, 0));

    await tester.pumpAndSettle();
    expect(find.text('Prakash'), findsNWidgets(0));
  });
}
