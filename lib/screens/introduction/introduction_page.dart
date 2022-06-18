import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/functions/routes.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';
import 'package:swipe_up/swipe_up.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  Random _random;

  @override
  void initState() {
    _random = Random();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwipeUp(
      color: Colors.black87,
      onSwipe: () async {
        return Routes.push(context, PageName.Login);
      },
      body: Material(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomText("Good Day,", fontSize: 40),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomText("Traveller!", fontSize: 32),
              ),
              const SizedBox(height: 30),
              Image.asset("assets/mama_pog_512.png"),
            ],
          ),
        ),
      ),
      child: const Material(
        color: Colors.transparent,
        child: Text(
          'Swipe Up',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
