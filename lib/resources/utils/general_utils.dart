import 'package:flutter/material.dart';

class Utils {

  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}