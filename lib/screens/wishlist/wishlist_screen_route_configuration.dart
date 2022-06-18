import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_impuls/enums/page_name.dart';
import 'wishlist_screen.dart';

class WishlistScreenRouteConfiguration extends BaseRouteConfiguration {
  WishlistScreenRouteConfiguration() : super(PageName.Wishlist);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return WishlistScreen();
  }
}
