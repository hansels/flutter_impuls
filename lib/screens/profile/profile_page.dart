import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';
import 'package:flutter_impuls/screens/profile/widgets/hemat_card.dart';
import 'package:flutter_impuls/screens/profile/widgets/profile_card.dart';
import 'package:flutter_impuls/screens/profile/widgets/profile_chart.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';
import 'package:flutter_impuls/widgets/long_raised_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileCard(),
          HematCard(),
          ProfileChart(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0, top: 20.0),
            child: Center(
              child: LongRaisedButton(
                height: 50,
                dividedBy: 1.2,
                onPressed: () {},
                child: const CustomText(
                  "Logout",
                  color: Configs.backgroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
