import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';
import 'package:tokoto_e_commerce/presentation/screens/home/components/popular_product.dart';

import '../../../helper/size_config.dart';
import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/special_offers.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProductCubit(), child: Center(
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const HomeHeader(),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  const DiscountBanner(),
                  const Categories(),
                  const SpecialOffers(),
                  SizedBox(height: getProportionateScreenWidth(30)),
                  const PopularProducts(),
                  SizedBox(height: getProportionateScreenWidth(30)),
                ],
              ),
            ),
          );
        },
      ),
    ),);
  }


}