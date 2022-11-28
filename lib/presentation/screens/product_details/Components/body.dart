import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';

import '../../../../helper/size_config.dart';
import '../../../widgets/default_button.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    return ListView(
      children: [
        const ProductImages(),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              const ProductDescription(),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    const ColorDots(),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: BlocBuilder<ProductCubit, ProductState>(
                          builder: (context, state) {
                            return DefaultButton(
                              text: cubit.currentProductDetails.isInCart
                                  ? "Update"
                                  : "Add To Cart",
                              func: () {
                                if (cubit.currentProductDetails.isInCart) {
                                  cubit.updateInCart();
                                } else {
                                  cubit.addToCart();
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
