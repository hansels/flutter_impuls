import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/screens/base_screen.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/screens/wishlist/wishlist_page.dart';

class WishlistScreen extends BaseScreen {
  WishlistScreen()
      : super(
          PageName.Wishlist,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return const WishlistPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
