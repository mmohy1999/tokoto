import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/layout/layout_cubit.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';
import 'package:tokoto_e_commerce/presentation/layouts/layout_bottom_navigation/bottom_navigation.dart';
import '../../../constants/enum.dart';

class LayoutBottomNavigation extends StatelessWidget {
  const LayoutBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => ProductCubit()),
      ],
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return Scaffold(
              appBar: LayoutCubit.get(context).selectedMenu != MenuState.home
                  ? AppBar(
                      title: Text(LayoutCubit.get(context).selectedMenu.name),
                    )
                  : null,
              body: LayoutCubit.get(context).body,
              bottomNavigationBar: const BottomNavigation());
        },
      ),
    );
  }
}
