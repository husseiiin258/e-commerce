import 'package:flutter/material.dart';
typedef Validator = String? Function(String?);

class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null) {
      return "this field is required";
    } else if (val.trim().isEmpty) {
      return "this field is required";
    } else if (emailRegex.hasMatch(val) == false) {
      return "enter valid email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*?[0-9]).{8,}$');
    if (val == null) {
      return "this field is required";
    } else if (val.trim().isEmpty) {
      return "this field is required";
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return "strong password please";
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return "this field is required";
    } else if (val != password) {
      return "password dose not match";
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    RegExp usernameRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (val == null) {
      return "this field is required";
    } else if (val.trim().isEmpty) {
      return "this field is required";
    } else if (!usernameRegex.hasMatch(val)) {
      return "please enter valid username";
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null) {
      return "this field is required";
    } else if (val.trim().isEmpty) {
      return "this field is required";
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return "this field is required";
    } else if (int.tryParse(val.trim()) == null) {
      return "enter numbers only";
    } else if (val.trim().length != 11) {
      return "phone number must be 11 number";
    } else {
      return null;
    }
  }
}
