import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/size_config.dart';


Row buildError(String text) {
  return Row( children: [
    SvgPicture.asset('assets/icons/Error.svg',
      height: getProportionateScreenHeight(14),
      width:getProportionateScreenWidth(14) ,),
    SizedBox(width: getProportionateScreenWidth(10),),
    Text(text)
  ],);
}