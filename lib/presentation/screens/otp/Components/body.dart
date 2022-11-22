import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import 'otp_form.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight *0.04,),
              Text("OTP Verification",
                style:  headingStyle
                ,),
              const Text('we sent your code to +201151621899'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text(
                    "this code will expired in ",
                    textAlign: TextAlign.center,),
                  buildTimer()
                ],
              ),
              const OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: const Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  TweenAnimationBuilder<double> buildTimer() {
    return TweenAnimationBuilder<double>(tween: Tween(begin: 30.0,end: 0.0), duration: const Duration(seconds: 30),
                  builder: (context, value, child) {
                 return Text('00:${value.toInt()}',style: const TextStyle(color: kPrimaryColor),);
                },
                onEnd: (){

                },);
  }
}
