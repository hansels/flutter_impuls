import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_impuls/enums/page_name.dart';
import 'login_screen.dart';

class LoginScreenRouteConfiguration extends BaseRouteConfiguration {
  LoginScreenRouteConfiguration() : super(PageName.Login);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return LoginScreen();
  }
}
