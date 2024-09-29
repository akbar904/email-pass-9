
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simpleapp/screens/login/login_cubit.dart';
import 'package:com.example.simpleapp/screens/login/login_state.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('LoginCubit', () {
		late LoginCubit loginCubit;

		setUp(() {
			loginCubit = LoginCubit();
		});

		tearDown(() {
			loginCubit.close();
		});

		test('initial state is LoginInitial', () {
			expect(loginCubit.state, equals(LoginInitial()));
		});

		blocTest<LoginCubit, LoginState>(
			'login emits [LoginLoading, LoginSuccess] when login is successful',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => <LoginState>[
				LoginLoading(),
				LoginSuccess(),
			],
		);

		blocTest<LoginCubit, LoginState>(
			'login emits [LoginLoading, LoginFailure] when login fails',
			build: () => loginCubit,
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => <LoginState>[
				LoginLoading(),
				LoginFailure('Invalid email or password'),
			],
		);
	});
}
