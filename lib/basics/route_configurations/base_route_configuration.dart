import 'package:flutter/material.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/interfaces/i_route_configuration.dart';

abstract class BaseRouteConfiguration implements IRouteConfiguration {
  final Function(BuildContext context) builder;
  PageName pageName;

  BaseRouteConfiguration(this.pageName, {this.builder});

  Future<Widget> getScreen(BuildContext context) {
    return Future.value(builder(context));
  }
}
