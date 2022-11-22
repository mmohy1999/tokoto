import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/auth/auth_cubit.dart';

import '../../../../constants/constants.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/build_error.dart';
import '../../../widgets/custom_suffix_icon.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/no_account.dart';



class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  List<String> errors=[];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit =AuthCubit.get(context);
    return Form(
      key: cubit.forgetPasswordFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: cubit.emailController,
            onChanged: cubit.onChangedEmail,
            validator:cubit.validationEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
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
          ),
          SizedBox(height: getProportionateScreenHeight(30),),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                     children: List.generate(
                        cubit.errors.length, (index) => buildError(cubit.errors[index])));
          },
        ),
          SizedBox(height: SizeConfig.screenHeight*0.1,),
          DefaultButton(text: 'Continue',func: () {
            cubit.validationForgetPasswordForm(context);
          },),
          SizedBox(height: SizeConfig.screenHeight*0.1,),
          const NoAccountText()
        ],
      ),
    );
  }
}