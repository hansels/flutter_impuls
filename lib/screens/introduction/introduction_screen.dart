import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/screens/base_screen.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/screens/introduction/introduction_page.dart';

class IntroductionScreen extends BaseScreen {
  IntroductionScreen()
      : super(
          PageName.Introduction,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return const IntroductionPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
