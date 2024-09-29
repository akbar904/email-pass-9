
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
	HomeCubit() : super(HomeInitial());

	void logout() async {
		try {
			emit(HomeLoading());
			// Simulate a delay for logout operation
			await Future.delayed(Duration(seconds: 1));
			emit(HomeLoggedOut());
		} catch (e) {
			emit(HomeError("Logout failed"));
		}
	}
}
