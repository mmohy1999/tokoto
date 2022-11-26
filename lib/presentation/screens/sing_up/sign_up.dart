import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/auth/auth_cubit.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/sign_up';
  static late AuthCubit cubit;
  @override
  Widget build(BuildContext context) {
    final cubitContext =
        ModalRoute.of(context)!.settings.arguments as BuildContext;
    cubit = AuthCubit.get(cubitContext);

    return BlocProvider.value(
      value: cubit,
      child: WillPopScope(
        onWillPop: () => cubit.onBack(context: context, currentRote: routeName),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Sign Up'),
            ),
            body: const Body()),
      ),
    );
  }
}
