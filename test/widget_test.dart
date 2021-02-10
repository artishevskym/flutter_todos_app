// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_todos_app/main.dart';

/*
Feature: User is able to successfully add new todos to the list (just a title)

Scenario1: Add todo to the list
GIVEN I have launched the ToDoList app with no todos
WHEN I add ‘Create test scenarios’ todo
THEN the ‘Create test scenarios’ item must be added to the list

Feature: User is able to check off todos when they’re finished which removes them from the list

Scenario2: Remove todo from the list
GIVEN I have launched the ToDoList app with ‘Create test scenarios’ item
WHEN I tap ‘Create test scenarios’ item when it is finished
THEN the ‘Create test scenarios’ item must be removed from the list

End-to-end test

Scenario3: Plan 3 MITs and execute it
GIVEN I have launched the ToDoList app with no todos
AND I have added ‘Create test scenarios’ todo
AND I have added ‘Write an application’ todo
AND I have added ‘Verify test scenarios’ todo
WHEN I tap ‘Write an application’ todo
THEN the ‘Write an application’ item must be removed from the list
WHEN I tap ‘Verify test scenarios’ todo
THEN the ‘Verify test scenarios’ item must be removed from the list
WHEN I tap ‘Create test scenarios’ item when it is finished
THEN the ‘Create test scenarios’ item must be removed from the list
AND there is no more todos in the list
 */
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
