
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_cubit.dart';
import 'login_state.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
	@override
	_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();
	late LoginCubit _loginCubit;

	@override
	void initState() {
		super.initState();
		_loginCubit = LoginCubit();
	}

	@override
	void dispose() {
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: BlocProvider(
				create: (_) => _loginCubit,
				child: BlocListener<LoginCubit, LoginState>(
					listener: (context, state) {
						if (state is LoginSuccess) {
							Navigator.pushReplacementNamed(context, '/home');
						} else if (state is LoginFailure) {
							// Handle login failure (show error message)
							showDialog(
								context: context,
								builder: (context) => AlertDialog(
									title: Text('Login Failed'),
									content: Text(state.error),
									actions: <Widget>[
										TextButton(
											child: Text('OK'),
											onPressed: () => Navigator.of(context).pop(),
										)
									],
								),
							);
						}
					},
					child: Padding(
						padding: const EdgeInsets.all(16.0),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								TextField(
									controller: _emailController,
									decoration: InputDecoration(labelText: 'Email'),
								),
								TextField(
									controller: _passwordController,
									decoration: InputDecoration(labelText: 'Password'),
									obscureText: true,
								),
								SizedBox(height: 20),
								CustomButton(
									onPressed: () {
										final email = _emailController.text;
										final password = _passwordController.text;
										_loginCubit.login(email, password);
									},
									label: 'Login',
								),
							],
						),
					),
				),
			),
		);
	}
}
