import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubitContext =
        ModalRoute.of(context)!.settings.arguments as BuildContext;
    ProductCubit cubit = ProductCubit.get(cubitContext);
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const Text(
                "Your Cart",
                style: TextStyle(color: Colors.black),
              ),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  return Text(
                    "${cubit.cartList.length} items",
                    style: Theme.of(context).textTheme.caption,
                  );
                },
              ),
            ],
          ),
        ),
        body: const Body(),
        bottomNavigationBar: const CheckoutCard(),
      ),
    );
  }
}
