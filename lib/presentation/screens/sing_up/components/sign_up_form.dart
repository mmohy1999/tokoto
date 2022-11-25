import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/auth/auth_cubit.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/build_error.dart';
import '../../../widgets/custom_suffix_icon.dart';
import '../../../widgets/default_button.dart';

class SignUpForm extends StatelessWidget {


  const SignUpForm({super.key});


  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return Form(
      key: cubit.signUpFormKey,
      child: Column(
        children: [
          buildEmailFormField(cubit),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(cubit),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRePasswordFormField(cubit),
          SizedBox(height: getProportionateScreenHeight(40)),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                  children: List.generate(
                      cubit.errors.length, (index) =>
                      buildError(cubit.errors[index])));
            },
          ),
          DefaultButton(
            text: 'Continue',
            func: () {
              cubit.validationSingUPForm(context);
            },
          )
        ],
      ),
    );
  }


  TextFormField buildEmailFormField(AuthCubit cubit) {
    return TextFormField(
      controller: cubit.emailController,
      textInputAction: TextInputAction.next,
      autofocus: true,
      onChanged: cubit.onChangedEmail,
      validator: cubit.validationEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Email',
          hintText: 'Enter your email',
          suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Mail.svg')),
    );
  }

  TextFormField buildPasswordFormField(AuthCubit cubit) {
    return TextFormField(
      controller: cubit.passwordController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: cubit.onChangedPassword,
      validator: cubit.validationPassword,
      decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'password',
          hintText: 'Enter your password',
          suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Lock.svg')),
    );
  }

  TextFormField buildRePasswordFormField(AuthCubit cubit) {
    return TextFormField(
      controller: cubit.rePasswordController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: cubit.onChangedRePassword,
      validator: cubit.validationRePassword,
      decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Confirm Password',
          hintText: 'Re-enter your password',
          suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Lock.svg')),
    );
  }

}
