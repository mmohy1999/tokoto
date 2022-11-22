import 'package:flutter/material.dart';

import '../../helper/size_config.dart';
import '../../constants/constants.dart';

class  DefaultButton extends StatelessWidget {
  DefaultButton ({ required this.text,required this.func,Key? key}) : super(key: key);
  String text;
  VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))// Background Color
      ),
        onPressed: func
        , child:  Text(text,
          style: TextStyle(fontSize: getProportionateScreenWidth(18),
              color: Colors.white),),
      ),
    );
  }
}
