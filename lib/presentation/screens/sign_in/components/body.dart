import 'package:flutter/material.dart';
import 'package:tokoto_e_commerce/presentation/screens/sign_in/components/sing_in_form.dart';

import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/no_account.dart';
import '../../../widgets/social_card.dart';




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
              SizedBox(height: SizeConfig.screenHeight*0.04,),
              Text(
                'Welcome Back',
                style: headingStyle,
              ),
              const Text(
                'Sign in with your email and password \nor continue with social media',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              SizedBox(height: SizeConfig.screenHeight*0.08,),
               const SignForm(),
              SizedBox(height: SizeConfig.screenHeight*0.08,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SocialCard(icon: 'assets/icons/google-icon.svg',func: () {

                   },),
                   SocialCard(icon: 'assets/icons/facebook-2.svg',func: () {

                   },),
                   SocialCard(icon: 'assets/icons/twitter.svg',func: () {

                   },),
                 ],
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              const NoAccountText()

            ],
          ),
        ),
      ),
    );
  }
}


