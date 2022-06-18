import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/screens/base_screen.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/screens/profile/profile_page.dart';

class ProfileScreen extends BaseScreen {
  ProfileScreen()
      : super(
          PageName.Profile,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return const ProfilePage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
