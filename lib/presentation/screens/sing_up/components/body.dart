import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/social_card.dart';
import 'sign_up_form.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight*0.04,),
              Text(
                'Register Account',
                style: headingStyle,
              ),
              const Text(
                'Complete your details or continue \nwith social media',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              SizedBox(height: SizeConfig.screenHeight*0.08,),
              const SignUpForm(),
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
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text('By continuing your confirm that agree \nwith our term and condition',
                  textAlign: TextAlign.center
                  ,style: TextStyle()),
            ],
          ),
        )
      ),
    );
  }
}
