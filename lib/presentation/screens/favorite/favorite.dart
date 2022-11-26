import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/layout/layout_cubit.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';
import '../../../constants/enum.dart';
import 'components/body.dart';
import 'components/no_fav.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    return WillPopScope(
      onWillPop: () =>
          LayoutCubit.get(context).changeNavigationBar(MenuState.home),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) => cubit.favProducts.isNotEmpty
            ? Body(cubit: cubit)
            : const NoFavorite(),
      ),
    );
  }
}
