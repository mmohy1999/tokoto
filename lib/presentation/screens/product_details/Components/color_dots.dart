import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';

import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return Row(
            children: [
              ...List.generate(
                cubit.currentProductDetails.colors.length,
                (index) => ColorDot(
                  color: cubit
                      .currentProductDetails.colors[index],
                  isSelected: index == cubit.selectedColor,
                  index: index,
                ),
              ),
              const Spacer(),
              RoundedIconBtn(
                icon: Icons.remove,
                press: cubit.subSelectedCount,
                isDisabled: cubit.selectedCount <= 1,
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Text(
                cubit.selectedCount.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              RoundedIconBtn(
                icon: Icons.add,
                press: cubit.addSelectedCount,
                isDisabled: cubit.selectedCount >= 10,
              ),
            ],
          );
        },
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
    required this.index,
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ProductCubit.get(context).changeSelectedColor(index),
      child: Container(
        margin: const EdgeInsets.only(right: 2),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key,
    required this.icon,
    required this.press,
    this.isDisabled,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCancelCallback press;
  final bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            blurRadius: 10,
            color: const Color(0xFFB0B0B0).withOpacity(0.2),
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: kPrimaryColor,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: isDisabled != null && isDisabled! ? null : press,
        child: Icon(icon),
      ),
    );
  }
}
