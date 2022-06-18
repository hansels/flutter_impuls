import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_impuls/enums/page_name.dart';
import 'profile_screen.dart';

class ProfileScreenRouteConfiguration extends BaseRouteConfiguration {
  ProfileScreenRouteConfiguration() : super(PageName.Profile);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return ProfileScreen();
  }
}
