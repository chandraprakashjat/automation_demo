import 'package:flutter/material.dart';
import 'package:test_widget/scroll_widget.dart';

void main() {
  runApp(ScrollWidget(
    list: List.generate(1000, (index) => 'Item $index'),
  ));
}
