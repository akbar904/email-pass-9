
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
	final String email;
	final String password;
	final bool isLoading;
	final String errorMessage;

	const LoginState({
		required this.email,
		required this.password,
		required this.isLoading,
		required this.errorMessage,
	});

	factory LoginState.initial() {
		return const LoginState(
			email: '',
			password: '',
			isLoading: false,
			errorMessage: '',
		);
	}

	LoginState copyWith({
		String? email,
		String? password,
		bool? isLoading,
		String? errorMessage,
	}) {
		return LoginState(
			email: email ?? this.email,
			password: password ?? this.password,
			isLoading: isLoading ?? this.isLoading,
			errorMessage: errorMessage ?? this.errorMessage,
		);
	}

	@override
	List<Object> get props => [email, password, isLoading, errorMessage];

	@override
	String toString() {
		return 'LoginState(email: $email, password: $password, isLoading: $isLoading, errorMessage: $errorMessage)';
	}
}
