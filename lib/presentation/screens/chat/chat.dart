import 'package:flutter/material.dart';

import '../../../business_logic/layout/layout_cubit.dart';
import '../../../constants/enum.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => LayoutCubit.get(context).changeNavigationBar(MenuState.home),
      child: const Center(
        child: Text('chat'),
      ),
    );
  }
}
