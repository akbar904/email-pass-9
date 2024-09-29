
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simpleapp/screens/home/home_state.dart';

void main() {
	group('HomeState', () {
		// Assuming HomeState is an immutable class with different states like HomeInitial, HomeLoading, HomeLoaded, HomeError
		test('supports value equality', () {
			expect(HomeState(), equals(HomeState()));
		});

		test('props are correct', () {
			expect(HomeState().props, []);
		});

		group('HomeInitial', () {
			test('supports value equality', () {
				expect(HomeInitial(), equals(HomeInitial()));
			});

			test('props are correct', () {
				expect(HomeInitial().props, []);
			});
		});

		group('HomeLoading', () {
			test('supports value equality', () {
				expect(HomeLoading(), equals(HomeLoading()));
			});

			test('props are correct', () {
				expect(HomeLoading().props, []);
			});
		});

		group('HomeLoaded', () {
			const String mockData = 'mock data';

			test('supports value equality', () {
				expect(HomeLoaded(mockData), equals(HomeLoaded(mockData)));
			});

			test('props are correct', () {
				expect(HomeLoaded(mockData).props, [mockData]);
			});
		});

		group('HomeError', () {
			const String errorMessage = 'Error occurred';

			test('supports value equality', () {
				expect(HomeError(errorMessage), equals(HomeError(errorMessage)));
			});

			test('props are correct', () {
				expect(HomeError(errorMessage).props, [errorMessage]);
			});
		});
	});
}
