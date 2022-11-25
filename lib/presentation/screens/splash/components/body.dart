import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/splash/splash_cubit.dart';
import 'package:tokoto_e_commerce/presentation/screens/splash/components/splash_content.dart';

import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/default_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            final SplashCubit cubit = SplashCubit.get(context);
            return Column(
              children: [
                Expanded(
                    flex: 3,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        cubit.changePage(value);
                      },
                      itemCount: cubit.splashData.length,
                      itemBuilder: (context, index) => SplashContent(
                          text: cubit.splashData[index]['text']!,
                          image: cubit.splashData[index]['image']!),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        children: [
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              cubit.splashData.length,
                              (index) => buildDot(
                                  index: index, currentPage: cubit.currentPage),
                            ),
                          ),
                          const Spacer(flex: 3),
                          DefaultButton(
                            text: 'continue',
                            func: () {
                              cubit.navigateTo(context);
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index, required int currentPage}) {
    
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFB8D8D8D),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
