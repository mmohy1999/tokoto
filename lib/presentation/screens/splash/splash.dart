
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/splash/splash_cubit.dart';
import '../../../helper/size_config.dart';
import 'components/body.dart';
class SplashScreen extends StatelessWidget {
  static const String routeName ='/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
      body: BlocProvider(create: (context) => SplashCubit(),child: const Body(),)
       ,
    );
  }
}
