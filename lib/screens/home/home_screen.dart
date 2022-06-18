import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_impuls/basics/screens/base_screen.dart';
import 'package:flutter_impuls/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/functions/routes.dart';
import 'package:flutter_impuls/screens/home/home_page.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends BaseScreenWithAppBar {
  HomeScreen()
      : super(
          "Nasihat Mama",
          PageName.Home,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return const HomePage();
  }

  @override
  Widget appBar(BuildContext context) {
    return AppBar(
      title: const CustomText("Nasihat Mama", fontSize: 20),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.heart,
            color: Colors.black,
          ),
          onPressed: () => Routes.push(context, PageName.Wishlist),
        ),
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.circleUser,
            color: Colors.black,
          ),
          onPressed: () => Routes.push(context, PageName.Profile),
        ),
      ],
    );
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
