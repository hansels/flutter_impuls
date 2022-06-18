import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_impuls/enums/page_name.dart';
import 'home_screen.dart';

class HomeScreenRouteConfiguration extends BaseRouteConfiguration {
  HomeScreenRouteConfiguration() : super(PageName.Home);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return HomeScreen();
  }
}
