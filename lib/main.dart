import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';
import 'package:flutter_impuls/firebase_options.dart';
import 'package:flutter_impuls/functions/token_version.dart';
import 'package:flutter_impuls/screens/home/home_screen.dart';
import 'package:flutter_impuls/screens/introduction/introduction_screen.dart';
import 'package:flutter_impuls/widgets/animated_splash/animated_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Configs.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Svenska",
        primaryColor: Configs.primaryColor,
        accentColor: Configs.secondaryColor,
        errorColor: Configs.dangerColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplash.styled(
        imagePath: "assets/mama_smile_512.png",
        customFunction: getHomeScreen(context),
        curve: Curves.easeInOutCirc,
        style: AnimationStyle.FadeIn,
        // backgroundColor: Configs.primaryColor,
      ),
    );
  }

  static Future<Widget> getHomeScreen(BuildContext context) async {
    String email = await TokenVersion.getEmail();

    if (email.isNotEmpty) {
      return HomeScreen();
    } else {
      return IntroductionScreen();
    }
  }
}
