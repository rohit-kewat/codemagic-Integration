// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_codemagic_integration/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
        'tap on variables and verify addition,subtraction,division and multiplication of variables.',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      // Verify the counter starts at 0.
      expect(find.widgetWithText(FlatButton, '0'), findsOneWidget);
      expect(find.widgetWithText(FlatButton, '1'), findsOneWidget);
      expect(find.widgetWithText(FlatButton, '2'), findsOneWidget);
      expect(find.widgetWithText(FlatButton, '3'), findsOneWidget);
      expect(find.widgetWithText(FlatButton, '4'), findsOneWidget);
      expect(find.widgetWithText(FlatButton, '5'), findsOneWidget);
      expect(find.widgetWithText(FlatButton, 'C'), findsOneWidget);
      expect(find.widgetWithText(FlatButton, 'x'), findsOneWidget);
      expect(find.widgetWithText(FlatButton, '+'), findsOneWidget);

      // Check Summation of two number.
      // ignore: deprecated_member_use
      final variable1 = find.widgetWithText(FlatButton, '9');
      final variable2 = find.widgetWithText(FlatButton, '3');

      await tester.tap(find.widgetWithText(FlatButton, 'C'));
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(variable1);
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.widgetWithText(FlatButton, '+'));
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(variable2);
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.widgetWithText(FlatButton, '='));
      await tester.pump(const Duration(seconds: 3));

      expect(find.text('12'), findsOneWidget);

      // Check Subtraction two number.
      await tester.tap(find.widgetWithText(FlatButton, 'C'));
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(variable1);
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.widgetWithText(FlatButton, '-'));
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(variable2);
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.widgetWithText(FlatButton, '='));
      await tester.pump(const Duration(seconds: 3));

      expect(find.text('6'), findsOneWidget);

      // Check Multiplication of two number.
      await tester.tap(find.widgetWithText(FlatButton, 'C'));
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(variable1);
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.widgetWithText(FlatButton, '*'));
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(variable2);
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.widgetWithText(FlatButton, '='));
      await tester.pump(const Duration(seconds: 3));

      expect(find.text('27'), findsOneWidget);

      await tester.tap(find.widgetWithText(FlatButton, 'C'));
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(variable1);
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.widgetWithText(FlatButton, '/'));
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(variable2);
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.widgetWithText(FlatButton, '='));
      await tester.pump(const Duration(seconds: 3));

      expect(find.text('3'), findsNWidgets(2));

      // // Finds the floating action button to tap on.
      // final Finder fab = find.byTooltip('Increment');

      // // Emulate a tap on the floating action button.
      // await tester.tap(fab);

      // // Trigger a frame.
      // await tester.pumpAndSettle();

      // // Verify the counter increments by 1.
      // expect(find.text('1'), findsOneWidget);
    });
  });
}
