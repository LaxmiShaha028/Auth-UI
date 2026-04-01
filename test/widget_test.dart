import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auth_ui/main.dart';

void main() {
  testWidgets('Login screen shows welcome text', (WidgetTester tester) async {
    // Build your AuthApp
    await tester.pumpWidget(const AuthApp());

    // Verify that "Welcome Back" text exists
    expect(find.text('Welcome Back'), findsOneWidget);

    // Verify that the Sign Up button exists
    expect(find.text('Sign Up'), findsOneWidget);

    // Tap the "Sign Up" text to switch screens
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Verify that Signup screen shows "Sign up" text
    expect(find.text('Sign up'), findsOneWidget);
  });
}