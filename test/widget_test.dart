import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_cloud/main.dart';

void main() {
  testWidgets('App starts and shows login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const InventoryApp());

    // Verify that the login screen is shown by checking for the Login text
    expect(find.text('Login'), findsOneWidget);

    // Verify that email and password fields are present
    expect(find.byType(TextField), findsNWidgets(2));

    // Verify that login button is present
    expect(find.text('Login'), findsWidgets);
  });
}
