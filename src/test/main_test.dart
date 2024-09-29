
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simpleapp/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
	group('Main Function Tests', () {
		test('main function should run without errors', () {
			expect(() => main(), returnsNormally);
		});
	});

	group('Main Widget Tests', () {
		testWidgets('App starts with LoginScreen', (tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.text('Login'), findsOneWidget);
		});

		testWidgets('App navigates to HomeScreen after login', (tester) async {
			await tester.pumpWidget(MyApp());

			await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
			await tester.enterText(find.byKey(Key('passwordField')), 'password');
			await tester.tap(find.byType(CustomButton));
			await tester.pumpAndSettle();

			expect(find.text('Home'), findsOneWidget);
			expect(find.text('Logout'), findsOneWidget);
		});
	});

	group('Cubit Tests', () {
		// Assuming there's a cubit in main.dart
		blocTest<LoginCubit, LoginState>(
			'LoginCubit emits correct states on successful login',
			build: () => LoginCubit(),
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [LoginLoading(), LoginSuccess()],
		);

		blocTest<HomeCubit, HomeState>(
			'HomeCubit emits correct states on logout',
			build: () => HomeCubit(),
			act: (cubit) => cubit.logout(),
			expect: () => [HomeInitial(), HomeLoggedOut()],
		);
	});
}
