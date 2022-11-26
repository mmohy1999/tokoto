import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';

import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(238),
              child: AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: cubit.demoProducts[cubit.currentProductDetails].id
                      .toString(),
                  child: Image.asset(cubit
                      .demoProducts[cubit.currentProductDetails]
                      .images[cubit.selectedImage]),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    cubit.demoProducts[cubit.currentProductDetails].images
                        .length,
                    (index) => buildSmallProductPreview(index, cubit)),
              ],
            )
          ],
        );
      },
    );
  }

  GestureDetector buildSmallProductPreview(int index, ProductCubit cubit) {
    return GestureDetector(
      onTap: () {
        cubit.changeSelectedImage(index);
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor
                  .withOpacity(cubit.selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(
            cubit.demoProducts[cubit.currentProductDetails].images[index]),
      ),
    );
  }
}
