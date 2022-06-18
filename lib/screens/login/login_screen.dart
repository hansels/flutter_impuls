import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/screens/base_screen.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/screens/login/login_page.dart';

class LoginScreen extends BaseScreen {
  LoginScreen()
      : super(
          PageName.Introduction,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return const LoginPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
