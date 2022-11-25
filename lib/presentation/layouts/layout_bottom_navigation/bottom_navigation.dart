import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../business_logic/layout/layout_cubit.dart';
import '../../../constants/constants.dart';
import '../../../constants/enum.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutCubit cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.15),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/Shop Icon.svg",
                          color: MenuState.home == cubit.selectedMenu
                              ? kPrimaryColor
                              : inActiveIconColor,
                        ),
                        onPressed: () {
                          cubit.changeNavigationBar(MenuState.home);
                        },
                      ),
                      SizedBox(
                        child: CircleAvatar(
                            backgroundColor:
                                cubit.selectedMenu == MenuState.home
                                    ? kPrimaryColor
                                    : Colors.transparent,
                            minRadius: 3),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/Heart Icon.svg",
                          color: MenuState.favourite == cubit.selectedMenu
                              ? kPrimaryColor
                              : inActiveIconColor,
                        ),
                        onPressed: () {
                          cubit.changeNavigationBar(MenuState.favourite);
                        },
                      ),
                      SizedBox(
                        child: CircleAvatar(
                            backgroundColor:
                                cubit.selectedMenu == MenuState.favourite
                                    ? kPrimaryColor
                                    : Colors.transparent,
                            minRadius: 3),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                            "assets/icons/Chat bubble Icon.svg",
                            color: MenuState.message == cubit.selectedMenu
                                ? kPrimaryColor
                                : inActiveIconColor),
                        onPressed: () {
                          cubit.changeNavigationBar(MenuState.message);
                        },
                      ),
                      SizedBox(
                        child: CircleAvatar(
                            backgroundColor:
                                cubit.selectedMenu == MenuState.message
                                    ? kPrimaryColor
                                    : Colors.transparent,
                            minRadius: 3),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/User Icon.svg",
                          color: MenuState.profile == cubit.selectedMenu
                              ? kPrimaryColor
                              : inActiveIconColor,
                        ),
                        onPressed: () {
                          cubit.changeNavigationBar(MenuState.profile);
                        },
                      ),
                      SizedBox(
                          child: CircleAvatar(
                              backgroundColor:
                                  cubit.selectedMenu == MenuState.profile
                                      ? kPrimaryColor
                                      : Colors.transparent,
                              minRadius: 3))
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }
}
