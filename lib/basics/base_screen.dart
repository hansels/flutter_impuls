import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_impuls/functions/screen_detector.dart';

abstract class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  Widget content(context);
  @override
  Widget? getDrawer();
  @override
  AppBar? getAppBar();
  @override
  Widget? floatingActionButton(context);

  @override
  _BaseScreenState createState() => _BaseScreenState();

  void initState() {}

  void dispose() {}
}

class _BaseScreenState extends State<BaseScreen> {
  void initState() {
    super.initState();
    widget.initState();
  }

  @override
  dispose() {
    super.dispose();
    widget.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? screenWidth;
    if (ScreenDetector.isWeb(context)) {
      screenWidth = 720;
    }
    return SizedBox(
      width: screenWidth,
      child: Scaffold(
        appBar: widget.getAppBar(),
        body: Center(
          child: widget.content(context),
        ),
        drawer: widget.getDrawer(),
        floatingActionButton: widget.floatingActionButton(context),
      ),
    );
  }
}
