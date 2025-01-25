import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/auth/register/view_model/generics/signup_generics.dart';

final signupProvider = StateNotifierProvider<SignupController, SignupGenerics> ((ref) => SignupController());

class SignupController extends StateNotifier<SignupGenerics> {
  SignupController() : super(SignupGenerics());

  Future<void> updateStatus({
    required bool isEmail, required bool isPassword, required bool isName,
    required bool isConfirmPassword, required bool isPhone
  }) async {
    state = state.update(isName: isName, isConfirmPassword: isConfirmPassword, isPhone: isPhone, isEmail: isEmail, isPassword: isPassword);
  }
}