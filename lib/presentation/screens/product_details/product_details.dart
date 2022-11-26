import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/product/product_cubit.dart';
import 'Components/custom_app_bar.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final BuildContext cubitContext =
        ModalRoute.of(context)!.settings.arguments as BuildContext;
    ProductCubit cubit = ProductCubit.get(cubitContext);
    return BlocProvider.value(
      value: cubit,
      child: WillPopScope(
        onWillPop: () => cubit.onBack(context),
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F6F9),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: CustomAppBar(
                rating: cubit.currentProductDetails.rating),
          ),
          body: const Body(),
        ),
      ),
    );
  }
}
