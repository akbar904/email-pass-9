
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simpleapp/models/user.dart';

void main() {
	group('User Model Tests', () {
		test('User model should correctly serialize from JSON', () {
			final json = {
				'email': 'test@example.com',
				'password': 'securepassword'
			};
			final user = User.fromJson(json);
			expect(user.email, 'test@example.com');
			expect(user.password, 'securepassword');
		});

		test('User model should correctly deserialize to JSON', () {
			final user = User(email: 'test@example.com', password: 'securepassword');
			final json = user.toJson();
			expect(json['email'], 'test@example.com');
			expect(json['password'], 'securepassword');
		});

		test('User model should have a valid toString method', () {
			final user = User(email: 'test@example.com', password: 'securepassword');
			expect(user.toString(), 'User(email: test@example.com, password: securepassword)');
		});

		// Add more tests for any other methods or properties in the User model if required
	});
}
