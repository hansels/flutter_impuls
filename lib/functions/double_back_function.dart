import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';

class DoubleBackFunction {
  static Widget use({@required Widget child}) {
    return DoubleBack(
      message: "Press Again To Close..",
      child: child,
    );
  }
}
