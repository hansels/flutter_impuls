import 'package:flutter/material.dart';
import 'package:flutter_impuls/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/functions/double_back_function.dart';
import 'introduction_screen.dart';

class IntroductionScreenRouteConfiguration extends BaseRouteConfiguration {
  IntroductionScreenRouteConfiguration() : super(PageName.Introduction);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return DoubleBackFunction.use(child: IntroductionScreen());
  }
}
