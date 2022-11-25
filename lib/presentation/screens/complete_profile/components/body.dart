import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import 'complete_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                'Complete Profile',
                style: headingStyle,
              ),
              const Text(
                'Complete your details or continue \nwith social media',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              const CompleteForm(),
            ],
          ),
        ),
      ),
    );
  }
}
