
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapp/screens/home/home_cubit.dart';
import 'package:simpleapp/screens/home/home_state.dart';
import 'package:simpleapp/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final homeCubit = context.read<HomeCubit>();

		return Scaffold(
			appBar: AppBar(
				title: Text('Home'),
			),
			body: Center(
				child: CustomButton(
					text: 'Logout',
					onPressed: () {
						homeCubit.logout();
					},
				),
			),
		);
	}
}
