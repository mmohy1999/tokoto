import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import '../../../layouts/layout_bottom_navigation/layout.dart';
import '../../../widgets/default_button.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight*0.04,),
        Image.asset('assets/images/success.png',
        height: SizeConfig.screenHeight*0.4,),
        SizedBox(height: SizeConfig.screenHeight*0.08,),
        Text('Login Success',
        style: headingStyle,),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth*0.6,
            child: DefaultButton(text: 'Back to home', func: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LayoutBottomNavigation(),), (route) => false);
            })
        ),

        const Spacer(),
      ],
    );
  }
}
