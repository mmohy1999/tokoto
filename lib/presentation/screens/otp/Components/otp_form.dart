import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/auth/auth_cubit.dart';

import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/default_button.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit cubit=AuthCubit.get(context);
        return Form(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      controller: cubit.pin1Controller,
                      autofocus: true,
                      style: const TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: cubit.onChangedPin1,
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      focusNode: cubit.pin2FocusNode,
                      controller: cubit.pin2Controller,
                      style: const TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged:cubit.onChangedPin2,
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      focusNode: cubit.pin3FocusNode,
                      controller: cubit.pin3Controller,
                      style: const TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged:cubit.onChangedPin3,
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      focusNode: cubit.pin4FocusNode,
                      controller: cubit.pin4Controller,
                      style: const TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: cubit.onChangedPin4,
                      validator: (value) {
                        if(value!.isEmpty){
                          return '';
                        }
                        return null;
                      },
                    ),
                  ),

                ],
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              DefaultButton(
                text: "Continue",
                func: () {
                  cubit.validationOtpForm(context);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
