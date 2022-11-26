import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';

import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            cubit.currentProductDetails.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  cubit.changeFavourite(
                      cubit.currentProductDetails);
                },
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  width: getProportionateScreenWidth(64),
                  decoration: BoxDecoration(
                    color: cubit.currentProductDetails
                            .isFavourite
                        ? const Color(0xFFFFE6E6)
                        : const Color(0xFFF5F6F9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: cubit.currentProductDetails
                            .isFavourite
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                    height: getProportionateScreenWidth(16),
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            cubit.currentProductDetails.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
