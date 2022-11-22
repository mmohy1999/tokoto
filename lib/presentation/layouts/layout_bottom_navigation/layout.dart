import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/auth/auth_cubit.dart';
import 'package:tokoto_e_commerce/business_logic/layout/layout_cubit.dart';
import 'package:tokoto_e_commerce/presentation/layouts/layout_bottom_navigation/bottom_navigation.dart';
import 'package:tokoto_e_commerce/presentation/screens/sign_in/sign_in.dart';

class LayoutBottomNavigation extends StatelessWidget {
  const LayoutBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: Scaffold(
          body:BlocBuilder<LayoutCubit,LayoutState>(builder: (context, state) => LayoutCubit.get(context).body,),
          bottomNavigationBar: const BottomNavigation()

      ),
    );
  }
}
