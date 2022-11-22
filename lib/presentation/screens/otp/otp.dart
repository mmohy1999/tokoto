import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/presentation/screens/sing_up/sign_up.dart';
import 'Components/body.dart';
class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static const String routeName='/otp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('OTP Verification'),),
      body:BlocProvider.value(value: SignUpScreen.cubit,child:const Body())
    );
  }
}
