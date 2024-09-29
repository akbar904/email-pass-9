
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simpleapp/screens/login/login_state.dart';

void main() {
	group('LoginState', () {
		group('initial state', () {
			test('should have initial state', () {
				final state = LoginState.initial();
				expect(state, LoginState.initial());
			});
		});

		group('copyWith', () {
			test('should copy state with new values', () {
				final state = LoginState.initial();
				final newState = state.copyWith(
					email: 'test@example.com',
					password: 'password123',
					isLoading: true,
					errorMessage: 'Invalid credentials',
				);

				expect(newState.email, 'test@example.com');
				expect(newState.password, 'password123');
				expect(newState.isLoading, true);
				expect(newState.errorMessage, 'Invalid credentials');
			});
		});

		group('equality', () {
			test('states with same values should be equal', () {
				final state1 = LoginState.initial();
				final state2 = LoginState.initial();

				expect(state1, state2);
			});

			test('states with different values should not be equal', () {
				final state1 = LoginState.initial();
				final state2 = state1.copyWith(email: 'test@example.com');

				expect(state1, isNot(state2));
			});
		});

		group('toString', () {
			test('should return a string representation of the state', () {
				final state = LoginState.initial().copyWith(
					email: 'test@example.com',
					password: 'password123',
					isLoading: true,
					errorMessage: 'Invalid credentials',
				);

				expect(
					state.toString(),
					'LoginState(email: test@example.com, password: password123, isLoading: true, errorMessage: Invalid credentials)',
				);
			});
		});
	});
}
