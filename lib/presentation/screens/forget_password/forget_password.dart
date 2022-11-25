import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/auth/auth_cubit.dart';
import 'components/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  static const String routeName = '/forget_password';

  @override
  Widget build(BuildContext context) {
    final cubitContext =
        ModalRoute.of(context)!.settings.arguments as BuildContext;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forget Password'),
        ),
        body: BlocProvider.value(
            value: AuthCubit.get(cubitContext), child: const Body()));
  }
}
