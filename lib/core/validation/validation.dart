import 'package:flutter/cupertino.dart';
import 'package:tech_mart/shared/widget/utils/toast.dart';

class Validation {

  static bool nameValidity({required String? name, required BuildContext context}){
    if (name == null || name.isEmpty || name.length < 3){
      Toast.showToast(context: context, message: "Invalid Name!", isWarning: true);
      return false;
    } else {
      return true;
    }
  }

  static bool phoneValidity({required String? phone, required BuildContext context}){
    final phoneRegex = RegExp(r'^01[7|6|3|8|9|5]\d{8}$');
    if (phone == null || phone.isEmpty || phone.length != 11 || !phoneRegex.hasMatch(phone)){
      Toast.showToast(context: context, message: "Invalid Phone Number!", isWarning: true);
      return false;
    } else {
      return true;
    }
  }

  static bool emailValidity({required String? email, required BuildContext context}){
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (email == null || email.isEmpty || !emailRegex.hasMatch(email)){
      Toast.showToast(context: context, message: "Invalid Email format!", isWarning: true);
      return false;
    }  else {
      return true;
    }
  }

  static bool passwordValidity({required String? password, required BuildContext context}){
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\d\s]).{6,}$');
    if (password == null || password.isEmpty || !passwordRegex.hasMatch(password)){
      Toast.showToast(context: context, message: "Password should contain at least 6 characters!", isWarning: true);
      return false;
    } else {
      return true;
    }
  }
}