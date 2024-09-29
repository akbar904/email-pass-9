
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simpleapp/screens/login/login_screen.dart';

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password fields', (WidgetTester tester) async {
			await tester.pumpWidget(LoginScreen());

			expect(find.byType(TextField), findsNWidgets(2));
		});

		testWidgets('should display login button', (WidgetTester tester) async {
			await tester.pumpWidget(LoginScreen());

			expect(find.byType(CustomButton), findsOneWidget);
		});
	});

	group('LoginCubit Tests', () {
		late LoginCubit loginCubit;

		setUp(() {
			loginCubit = LoginCubit();
		});

		blocTest<LoginCubit, LoginState>(
			'emits [LoginLoading, LoginSuccess] when login is successful',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [
				isA<LoginLoading>(),
				isA<LoginSuccess>(),
			],
		);

		blocTest<LoginCubit, LoginState>(
			'emits [LoginLoading, LoginFailure] when login fails',
			build: () => loginCubit,
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [
				isA<LoginLoading>(),
				isA<LoginFailure>(),
			],
		);
	});
}
