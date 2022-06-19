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
        return Routes.pushReplacement(context, PageName.Login);
      },
      body: Material(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 60, 30),
                child: Image.asset(
                  "assets/introduction.png",
                ),
              ),
              const SizedBox(height: 80),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: CustomText("Selamat Datang Kawan!",
                    fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomText(
                  "Sebelum Belanja, bisa konsultasi. Ayo berhemat bareng Mama",
                  fontSize: 18,
                ),
              ),
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
