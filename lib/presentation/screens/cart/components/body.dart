import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';
import '../../../../helper/size_config.dart';
import 'cart_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView.builder(
            itemCount: cubit.cartList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(cubit.cartList[index].product.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  cubit.removeFromCart(index);
                },
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: InkWell(
                    onTap: () => cubit.showProductDetails(
                        cubit.cartList[index].product, context),
                    child: CartCard(cart: cubit.cartList[index])),
              ),
            ),
          ),
        );
      },
    );
  }
}
