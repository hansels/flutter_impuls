import 'package:flutter/material.dart';
import 'package:flutter_impuls/enums/page_name.dart';

abstract class IRouteConfiguration {
  Future<Widget> getScreen(BuildContext context);
  PageName pageName;
}
