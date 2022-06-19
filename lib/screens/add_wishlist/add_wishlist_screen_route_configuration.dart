import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_impuls/enums/page_name.dart';
import 'add_wishlist_screen.dart';

class AddWishlistScreenRouteConfiguration extends BaseRouteConfiguration {
  AddWishlistScreenRouteConfiguration() : super(PageName.AddWishlist);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return AddWishlistScreen();
  }
}
