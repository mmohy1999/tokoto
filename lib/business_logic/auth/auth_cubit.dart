import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/presentation/screens/forget_password/forget_password.dart';
import 'package:tokoto_e_commerce/presentation/screens/sign_in/sign_in.dart';
import '../../constants/constants.dart';
import '../../presentation/screens/complete_profile/complete_profile.dart';
import '../../presentation/screens/login_success/login_success.dart';
import '../../presentation/screens/otp/otp.dart';
import '../../presentation/screens/sing_up/sign_up.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
//region Fields
  final signInFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  final completeFormKey = GlobalKey<FormState>();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  //region otp
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  //endregion
  late FocusNode passwordFocusNode = FocusNode();

  final List<String> errors = [];
  bool remember = false;

//endregion

//region Functions

  //region init State
  initStateSignUp() {
    errors.clear();
    emailController.clear();
    passwordController.clear();
    rePasswordController.clear();
    phoneController.clear();
    firstNameController.clear();
    lastNameController.clear();
    addressController.clear();
  }

  initStateOtp() {
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }
  //endregion

  nextField(FocusNode focusNode) {
    focusNode.requestFocus();
  }

  changeRemember() {
    remember = !remember;
    emit(ChangeRemember());
  }

  //region Dispose
  disposeSignUpBack() {
    emailController.clear();
    passwordController.clear();
    errors.clear();
  }

  disposeOtpBack() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }
  //endregion

//endregion

//region Navigation
  onBack({required BuildContext context, required String currentRote}) {
    switch (currentRote) {
      case SignUpScreen.routeName:
        disposeSignUpBack();
        break;
      case OtpScreen.routeName:
        disposeOtpBack();
        break;
    }

    Navigator.pop(context);
    emit(NavigationBack());
  }

  navigationTo(
      {required String route,
      required BuildContext context,
      Object? arguments}) {
    switch (route) {
      case SignUpScreen.routeName:
        initStateSignUp();
        break;
      case ForgetPasswordScreen.routeName:
        errors.clear();
        break;
    }
    Navigator.pushNamed(context, route, arguments: arguments);
  }
// endregion

//region  TextFormField onChange
  ValueChanged<String>? onChangedEmail(String value) {
    if (value.isNotEmpty && errors.contains(kEmailNullError)) {
      errors.remove(kEmailNullError);
      emit(RemoveError());
    } else if (emailValidatorRegExp.hasMatch(value) &&
        errors.contains(kEmailNullError)) {
      errors.remove(kInvalidEmailError);
      emit(RemoveError());
    }
    return null;
  }

  ValueChanged<String>? onChangedPassword(String value) {
    if (value.isNotEmpty) {
      if (errors.contains(kPassNullError)) {
        errors.remove(kPassNullError);
        emit(RemoveError());
      }
    } else if (value.length >= 8 && errors.contains(kShortPassError)) {
      errors.remove(kShortPassError);
      emit(RemoveError());
    }
    return null;
  }

  ValueChanged<String>? onChangedRePassword(String value) {
    if (value == passwordController.text) {
      if (errors.contains(kMatchPassError)) {
        errors.remove(kMatchPassError);
        emit(RemoveError());
      }
    }
    return null;
  }

  ValueChanged<String>? onChangedFirstName(String value) {
    if (value.isNotEmpty) {
      if (errors.contains(kNamelNullError)) {
        errors.remove(kNamelNullError);
        emit(RemoveError());
      }
    }
    return null;
  }

  ValueChanged<String>? onChangedLastName(String value) {
    if (value.isNotEmpty) {
      if (errors.contains(kNamelNullError)) {
        errors.remove(kNamelNullError);
        emit(RemoveError());
      }
    }
    return null;
  }

  ValueChanged<String>? onChangedPhone(String value) {
    if (value.isNotEmpty) {
      if (errors.contains(kPhoneNumberNullError)) {
        errors.remove(kPhoneNumberNullError);
        emit(RemoveError());
      }
    }
    return null;
  }

  ValueChanged<String>? onChangedAddress(String value) {
    if (value.isNotEmpty) {
      if (errors.contains(kAddressNullError)) {
        errors.remove(kAddressNullError);
        emit(RemoveError());
      }
    }
    return null;
  }

  //region otp
  onChangedPin1(String value) {
    if (value.length >= 2) {
      pin1Controller.clear();
      pin1Controller.text = value[1];
    }
    if (pin1Controller.text.length == 1) {
      nextField(pin2FocusNode);
    }
  }

  onChangedPin2(String value) {
    if (value.length >= 2) {
      pin2Controller.clear();
      pin2Controller.text = value[1];
    }
    if (pin2Controller.text.length == 1) {
      nextField(pin3FocusNode);
    }
  }

  onChangedPin3(String value) {
    if (value.length >= 2) {
      pin3Controller.clear();
      pin3Controller.text = value[1];
    }
    if (pin3Controller.text.length == 1) {
      nextField(pin4FocusNode);
    }
  }

  onChangedPin4(String value) {
    if (value.length >= 2) {
      pin4Controller.clear();
      pin4Controller.text = value[1];
    }
    if (pin4Controller.text.length == 1) {
      pin4FocusNode.unfocus();
    }
  }
  //endregion
//endregion

//region TextFormField validation
  String? validationEmail(String? value) {
    if (value!.isEmpty) {
      if (errors.contains(kInvalidEmailError)) {
        errors.remove(kInvalidEmailError);
        emit(RemoveError());
      }
      if (!errors.contains(kEmailNullError)) {
        errors.add(kEmailNullError);
        emit(AddError());
        return '';
      }
    } else if (!emailValidatorRegExp.hasMatch(value) &&
        !errors.contains(kInvalidEmailError)) {
      errors.add(kInvalidEmailError);
      emit(AddError());
      return '';
    }
    return null;
  }

  String? validationPassword(String? value) {
    if (value!.isEmpty) {
      if (errors.contains(kShortPassError)) {
        errors.remove(kShortPassError);
        emit(RemoveError());
      }
      if (!errors.contains(kPassNullError)) {
        errors.add(kPassNullError);
        emit(AddError());
      }
      return '';
    } else if (value.length < 8 && !errors.contains(kShortPassError)) {
      errors.add(kShortPassError);
      emit(AddError());
      return '';
    }
    return null;
  }

  String? validationRePassword(String? value) {
    if (value!.isEmpty) {
      return '';
    }
    if (value != passwordController.text) {
      if (!errors.contains(kMatchPassError)) {
        errors.add(kMatchPassError);
        emit(AddError());
      }
      return '';
    }
    return null;
  }

  String? validationFirstName(String? value) {
    if (value!.isEmpty) {
      if (!errors.contains(kNamelNullError)) {
        errors.add(kNamelNullError);
        emit(AddError());
      }
      return '';
    }
    return null;
  }

  String? validationLastName(String? value) {
    if (value!.isEmpty) {
      if (!errors.contains(kNamelNullError)) {
        errors.add(kNamelNullError);
        emit(AddError());
      }
      return '';
    }
    return null;
  }

  String? validationPhone(String? value) {
    if (value!.isEmpty) {
      if (!errors.contains(kPhoneNumberNullError)) {
        errors.add(kPhoneNumberNullError);
        emit(AddError());
      }
      return '';
    }
    return null;
  }

  String? validationAddress(String? value) {
    if (value!.isEmpty) {
      if (!errors.contains(kAddressNullError)) {
        errors.add(kAddressNullError);
        emit(AddError());
      }
      return '';
    }
    return null;
  }
//endregion

//region Form validation
  validationSingInForm(BuildContext context) {
    if (errors.isNotEmpty) {
      // errors.removeRange(0, errors.length - 1);
      errors.clear();
    }
    if (signInFormKey.currentState!.validate() && errors.isEmpty) {
      passwordFocusNode.unfocus();
      signInFormKey.currentState!.save();
      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    }
    emit(SignInValidation());
  }

  validationSingUPForm(BuildContext context) {
    if (errors.isNotEmpty) {
      errors.clear();
    }
    signUpFormKey.currentState!.save();
    if (signUpFormKey.currentState!.validate()) {
      Navigator.pushNamed(context, CompleteProfileScreen.routeName);
    }
  }

  validationCompleteForm(BuildContext context) {
    if (errors.isNotEmpty) {
      errors.clear();
    }
    if (completeFormKey.currentState!.validate() && errors.isEmpty) {
      // _formKey.currentState!.save();
      initStateOtp();
      Navigator.pushNamed(context, OtpScreen.routeName);
    }
  }

  validationOtpForm(BuildContext context) {
    String otp = pin1Controller.text +
        pin2Controller.text +
        pin3Controller.text +
        pin4Controller.text;
    debugPrint(otp);
  }

  validationForgetPasswordForm(BuildContext context) {
    if (errors.isNotEmpty) {
      errors.clear();
    }
    if (forgetPasswordFormKey.currentState!.validate()) {
      forgetPasswordFormKey.currentState!.save();
      onBack(context: context, currentRote: SignInScreen.routeName);
    }
  }

//endregion

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    pin1Controller.dispose();
    pin2Controller.dispose();
    pin3Controller.dispose();
    pin4Controller.dispose();
    return super.close();
  }
}
