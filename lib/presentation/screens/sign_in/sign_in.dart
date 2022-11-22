
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/auth/auth_cubit.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName='/signIn';
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Sign In',)),
      body:BlocProvider(create: (context) => AuthCubit(),child: const Body(),)
    );
  }
}
