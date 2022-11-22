import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import 'forget_password_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children:  [
              SizedBox(height: SizeConfig.screenHeight*0.04,),
               Text('Forget Password',
                style:  headingStyle
                ,),
              const Text(
                "please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight*0.1,),
              const ForgetPasswordForm()
            ],
          ),
        ),
      ),
    );
  }
}


