import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/presentation/screens/chat/chat.dart';
import 'package:tokoto_e_commerce/presentation/screens/favourite/favourite.dart';
import 'package:tokoto_e_commerce/presentation/screens/home/home.dart';
import 'package:tokoto_e_commerce/presentation/screens/profile/profile.dart';
import '../../constants/enum.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  MenuState selectedMenu = MenuState.home;
  Widget body = const HomeScreen();
  changeNavigationBar(MenuState menuState) {
    if (menuState != selectedMenu) {
      selectedMenu = menuState;
      changeBody(menuState);
      emit(ChangeNavigationBarState());
    }
  }

  changeBody(MenuState menuState) {
    switch (menuState) {
      case MenuState.home:
        body = const HomeScreen();
        return;
      case MenuState.favourite:
        body = const FavouriteScreen();
        return;
      case MenuState.message:
        body = const ChatScreen();
        return;
      case MenuState.profile:
        body = const ProfileScreen();
        return;
    }
  }
}
