
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simpleapp/screens/home/home_cubit.dart';
import 'package:com.example.simpleapp/screens/home/home_state.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
	group('HomeCubit Tests', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = MockHomeCubit();
		});

		tearDown(() {
			homeCubit.close();
		});

		blocTest<HomeCubit, HomeState>(
			'emits [HomeInitial] when HomeCubit is created',
			build: () => homeCubit,
			verify: (_) {
				expect(homeCubit.state, isA<HomeInitial>());
			},
		);

		blocTest<HomeCubit, HomeState>(
			'emits [HomeLoading, HomeLoggedOut] when logout is called',
			build: () {
				when(() => homeCubit.logout()).thenAnswer((_) async {});
				return homeCubit;
			},
			act: (cubit) => cubit.logout(),
			expect: () => [isA<HomeLoading>(), isA<HomeLoggedOut>()],
		);
	});
}
