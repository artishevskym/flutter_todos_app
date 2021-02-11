// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_todos_app/main.dart';

void main() {
  /*
    Feature: User is able to successfully add new todos to the list (just a title)

    Scenario: Add todo to the list
    GIVEN I have launched the ToDoList app with no todos
    WHEN I add ‘Create test scenarios’ todo
    THEN the ‘Create test scenarios’ item must be added to the list
   */
  testWidgets('testAddingTodo', (WidgetTester tester) async {
    // GIVEN I have launched the ToDoList app with no todos
    await tester.pumpWidget(TodosApp());

    // WHEN I add ‘Create test scenarios’ todo
    await addTodo(tester, 'Create test scenarios');

    // THEN the ‘Create test scenarios’ item must be added to the list
    expect(find.text('Create test scenarios'), findsOneWidget);
  });

  /*
    Feature: User is able to check off todos when they’re finished which removes them from the list

    Scenario: Remove todo from the list
    GIVEN I have launched the ToDoList app with ‘Create test scenarios’ item
    WHEN I tap ‘Create test scenarios’ item when it is finished
    THEN the ‘Create test scenarios’ item must be removed from the list
   */
  testWidgets('testRemovingTodo', (WidgetTester tester) async {
    // GIVEN I have launched the ToDoList app with ‘Create test scenarios’ item
    await tester.pumpWidget(TodosApp());
    await addTodo(tester, 'Create test scenarios');

    // WHEN I tap ‘Create test scenarios’ item when it is finished
    await tester.tap(find.text('Create test scenarios'));
    await tester.pump();

    // THEN the ‘Create test scenarios’ item must be removed from the list
    expect(find.text('Create test scenarios'), findsNothing);
  });

  /*
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
  testWidgets('test3MITs', (WidgetTester tester) async {
    // GIVEN I have launched the ToDoList app with no todos
    await tester.pumpWidget(TodosApp());

    // AND I have added ‘Create test scenarios’ todo
    await addTodo(tester, 'Create test scenarios');

    // AND I have added ‘Write an application’ todo
    await addTodo(tester, 'Write an application');

    // AND I have added ‘Verify test scenarios’ todo
    await addTodo(tester, 'Verify test scenarios');

    // WHEN I tap ‘Write an application’ todo
    await tester.tap(find.text('Write an application'));
    await tester.pump();

    // THEN the ‘Write an application’ item must be removed from the list
    expect(find.text('Verify test scenarios'), findsOneWidget);
    expect(find.text('Create test scenarios'), findsOneWidget);
    expect(find.text('Write an application'), findsNothing);

    // WHEN I tap ‘Verify test scenarios’ todo
    await tester.tap(find.text('Verify test scenarios'));
    await tester.pump();

    // THEN the ‘Verify test scenarios’ item must be removed from the list
    expect(find.text('Verify test scenarios'), findsNothing);
    expect(find.text('Create test scenarios'), findsOneWidget);
    expect(find.text('Write an application'), findsNothing);

    // WHEN I tap ‘Create test scenarios’ item when it is finished
    await tester.tap(find.text('Create test scenarios'));
    await tester.pump();

    // THEN the ‘Create test scenarios’ item must be removed from the list
    expect(find.text('Verify test scenarios'), findsNothing);
    expect(find.text('Create test scenarios'), findsNothing);
    expect(find.text('Write an application'), findsNothing);

    // AND there is no more todos in the list
    expect(find.byType(CheckboxListTile), findsNothing);
  });
}

Future addTodo(WidgetTester tester, String text) async {
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();
  await tester.enterText(find.byType(TextField), text);
  await tester.tap(find.widgetWithText(TextButton, 'Add'));
  await tester.pump();
}
