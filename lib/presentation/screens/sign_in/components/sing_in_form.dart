import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/auth/auth_cubit.dart';
import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/build_error.dart';
import '../../../widgets/custom_suffix_icon.dart';
import '../../../widgets/default_button.dart';
import '../../forget_password/forget_password.dart';


class SignForm extends StatelessWidget {
  const SignForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit cubit =AuthCubit.get(context);
        return Form(
          key: cubit.signInFormKey,
          child: Column(
            children: [
              buildEmailFormField(cubit),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPasswordFormField(cubit),
              SizedBox(height: getProportionateScreenHeight(30)),
              Row(children: [
                Checkbox(value: cubit.remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    cubit.changeRemember();
                  },),
                const Text('Remember me'),
                const Spacer(),
                TextButton(onPressed: () {
                  cubit.navigationTo(route: ForgetPasswordScreen.routeName,context:  context,arguments: context);
                },
                    child: const Text('Forget password', style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: kTextColor),)),
              ],),
              SizedBox(height: getProportionateScreenHeight(20)),
              Column(
                  children: List.generate(
                      cubit.errors.length, (index) => buildError(cubit.errors[index]))),
              DefaultButton(
                text: 'Continue',
                func: () {
                  cubit.validationSingInForm(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  TextFormField buildPasswordFormField(AuthCubit cubit) {
    return TextFormField(
      controller: cubit.passwordController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      focusNode: cubit.passwordFocusNode,
      obscureText: true,
      onChanged: cubit.onChangedPassword,
      validator: cubit.validationPassword,
      decoration:  InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'password',
          hintText: 'Enter your password',
          errorBorder: OutlineInputBorder(
              borderSide:cubit.errors.contains(kShortPassError)||cubit.errors.contains(kPassNullError)?const BorderSide(color: Colors.red):const BorderSide(color: kTextColor),
              borderRadius: BorderRadius.circular(28),
              gapPadding: 10
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:cubit.errors.contains(kShortPassError)||cubit.errors.contains(kPassNullError)?const BorderSide(color: Colors.red):const BorderSide(color: kTextColor),
              borderRadius: BorderRadius.circular(28),
              gapPadding: 10
          ),
          suffixIcon: const CustomSuffixIcon(icon: 'assets/icons/Lock.svg')),
    );
  }
  TextFormField buildEmailFormField(AuthCubit cubit) {
    return TextFormField(
      controller: cubit.emailController,
      onChanged: cubit.onChangedEmail,
      textInputAction: TextInputAction.next,
      validator: cubit.validationEmail,
      keyboardType: TextInputType.emailAddress,
      decoration:  InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Email',
          hintText: 'Enter your email',
          errorBorder: OutlineInputBorder(
            borderSide:cubit.errors.contains(kInvalidEmailError)||cubit.errors.contains(kEmailNullError)?const BorderSide(color: Colors.red):const BorderSide(color: kTextColor),
            borderRadius: BorderRadius.circular(28),
              gapPadding: 10
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:cubit.errors.contains(kInvalidEmailError)||cubit.errors.contains(kEmailNullError)?const BorderSide(color: Colors.red):const BorderSide(color: kTextColor),
              borderRadius: BorderRadius.circular(28),
              gapPadding: 10
          ),
          suffixIcon: const CustomSuffixIcon(icon: 'assets/icons/Mail.svg')),
    );
  }
}