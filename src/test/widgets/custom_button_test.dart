
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/custom_button.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
	group('CustomButton Widget Tests', () {
		testWidgets('CustomButton displays provided text', (WidgetTester tester) async {
			// Arrange
			const buttonText = 'Click Me';

			// Act
			await tester.pumpWidget(
				const MaterialApp(
					home: Scaffold(
						body: CustomButton(text: buttonText),
					),
				),
			);

			// Assert
			expect(find.text(buttonText), findsOneWidget);
		});

		testWidgets('CustomButton calls onPressed callback when tapped', (WidgetTester tester) async {
			// Arrange
			var wasPressed = false;
			void onPressed() {
				wasPressed = true;
			}

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							text: 'Click Me',
							onPressed: onPressed,
						),
					),
				),
			);

			// Tap the button
			await tester.tap(find.byType(CustomButton));
			await tester.pump();

			// Assert
			expect(wasPressed, isTrue);
		});
	});
}
