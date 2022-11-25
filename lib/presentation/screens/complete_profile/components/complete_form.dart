import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/business_logic/auth/auth_cubit.dart';
import '../../../../helper/size_config.dart';
import '../../../widgets/build_error.dart';
import '../../../widgets/custom_suffix_icon.dart';
import '../../../widgets/default_button.dart';

class CompleteForm extends StatelessWidget {
  const CompleteForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return Form(
      key: cubit.completeFormKey,
      child: Column(
        children: [
          buildFirstNameFormField(cubit),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildLastNameFormField(cubit),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPhoneFormField(cubit),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildAddressFormField(cubit),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                  children: List.generate(cubit.errors.length,
                      (index) => buildError(cubit.errors[index])));
            },
          ),
          DefaultButton(
            text: 'Continue',
            func: () {
              cubit.validationCompleteForm(context);
            },
          )
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField(AuthCubit cubit) {
    return TextFormField(
      controller: cubit.firstNameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onChanged: cubit.onChangedFirstName,
      validator: cubit.validationFirstName,
      decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'First Name',
          hintText: 'Enter your First Name',
          suffixIcon: CustomSuffixIcon(icon: 'assets/icons/User.svg')),
    );
  }

  TextFormField buildLastNameFormField(AuthCubit cubit) {
    return TextFormField(
      controller: cubit.lastNameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onChanged: cubit.onChangedLastName,
      validator: cubit.validationLastName,
      decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Last Name',
          hintText: 'Enter your Last Name',
          suffixIcon: CustomSuffixIcon(icon: 'assets/icons/User.svg')),
    );
  }

  TextFormField buildPhoneFormField(AuthCubit cubit) {
    return TextFormField(
      controller: cubit.phoneController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onChanged: cubit.onChangedPhone,
      validator: cubit.validationPhone,
      decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'phone Number',
          hintText: 'Enter your phone Number',
          suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Phone.svg')),
    );
  }

  TextFormField buildAddressFormField(AuthCubit cubit) {
    return TextFormField(
      controller: cubit.addressController,
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.done,
      onChanged: cubit.onChangedAddress,
      validator: cubit.validationAddress,
      decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Address',
          hintText: 'Enter your Address',
          suffixIcon:
              CustomSuffixIcon(icon: 'assets/icons/Location point.svg')),
    );
  }
}
