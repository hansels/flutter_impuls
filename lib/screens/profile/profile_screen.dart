import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_impuls/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/screens/profile/profile_page.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';

class ProfileScreen extends BaseScreenWithAppBar {
  ProfileScreen()
      : super(
          "Profile",
          PageName.Profile,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return const ProfilePage();
  }

  @override
  Widget appBar(BuildContext context) {
    return AppBar(
      title: const CustomText("Profile", fontSize: 20),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
