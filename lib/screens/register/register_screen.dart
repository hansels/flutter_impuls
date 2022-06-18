import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/screens/base_screen.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/screens/register/register_page.dart';

class RegisterScreen extends BaseScreen {
  RegisterScreen()
      : super(
          PageName.Register,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return const RegisterPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
