import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chattopic/main.dart';

void main() {
  testWidgets('Test renders mainapp', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(find.byKey(const Key('Home')), findsNothing);
  });
}
