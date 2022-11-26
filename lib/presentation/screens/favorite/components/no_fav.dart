import 'package:flutter/material.dart';

import '../../../../business_logic/layout/layout_cubit.dart';
import '../../../../constants/enum.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/default_button.dart';

class NoFavorite extends StatelessWidget {
  const NoFavorite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'No Favorite Yet !',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              DefaultButton(
                text: "Back To Home",
                func: () => LayoutCubit.get(context)
                    .changeNavigationBar(MenuState.home),
              )
            ],
          ),
        ),
      );
  }
}
