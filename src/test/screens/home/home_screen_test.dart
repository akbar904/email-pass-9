
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapp/screens/home/home_screen.dart';
import 'package:simpleapp/screens/home/home_cubit.dart';
import 'package:simpleapp/screens/home/home_state.dart';

// Mock HomeCubit class
class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays Logout button', (WidgetTester tester) async {
			// Arrange
			final mockHomeCubit = MockHomeCubit();
			when(() => mockHomeCubit.state).thenReturn(HomeInitial());

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<HomeCubit>(
						create: (context) => mockHomeCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.text('Logout'), findsOneWidget);
		});
	});

	group('HomeCubit Tests', () {
		blocTest<HomeCubit, HomeState>(
			'emits [] when nothing is added',
			build: () => HomeCubit(),
			expect: () => [],
		);

		blocTest<HomeCubit, HomeState>(
			'emits [HomeLoading, HomeLoggedOut] when logout is called',
			build: () => HomeCubit(),
			act: (cubit) => cubit.logout(),
			expect: () => [HomeLoading(), HomeLoggedOut()],
		);
	});
}
