import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_impuls/enums/page_name.dart';
import 'register_screen.dart';

class RegisterScreenRouteConfiguration extends BaseRouteConfiguration {
  RegisterScreenRouteConfiguration() : super(PageName.Register);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return RegisterScreen();
  }
}
