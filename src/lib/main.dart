
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login/login_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_cubit.dart';
import 'screens/home/home_cubit.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
			providers: [
				BlocProvider(create: (_) => LoginCubit()),
				BlocProvider(create: (_) => HomeCubit()),
			],
			child: MaterialApp(
				title: 'Simple App',
				theme: ThemeData(primarySwatch: Colors.blue),
				home: LoginScreen(),
			),
		);
	}
}
