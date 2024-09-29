
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
	LoginCubit() : super(LoginInitial());

	void login(String email, String password) async {
		try {
			emit(LoginLoading());

			// Simulate a network request
			await Future.delayed(Duration(seconds: 2));

			if (email == 'test@example.com' && password == 'password') {
				emit(LoginSuccess());
			} else {
				emit(LoginFailure('Invalid email or password'));
			}
		} catch (e) {
			emit(LoginFailure('An unknown error occurred'));
		}
	}
}
