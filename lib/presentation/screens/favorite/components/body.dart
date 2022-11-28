import 'package:flutter/material.dart';

import '../../../../business_logic/product/product_cubit.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/product_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final ProductCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
        child: GridView.builder(
          itemCount: cubit.favProducts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: index % 2 == 0
                  ? EdgeInsets.zero
                  : EdgeInsets.only(
                      top: getProportionateScreenWidth(20)),
              child: ProductCard(
                product: cubit.favProducts[index],
                index: index,
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              childAspectRatio: 0.68),
        ),
      );
  }
}