import 'package:flutter/cupertino.dart';
import 'package:tokoto_e_commerce/business_logic/auth/auth_cubit.dart';

import '../../constants/constants.dart';
import '../../helper/size_config.dart';
import '../screens/sing_up/sign_up.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("don't have account?",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => AuthCubit.get(context).navigationTo(route: SignUpScreen.routeName,context:  context,arguments: context),
          child: Text("sign up",
            style: TextStyle(fontSize: getProportionateScreenWidth(16),color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
