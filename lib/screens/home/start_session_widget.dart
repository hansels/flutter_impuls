import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';
import 'package:flutter_impuls/widgets/long_raised_button.dart';

class StartSessionWidget extends StatelessWidget {
  final Function onPressedStartSession;
  const StartSessionWidget({
    Key key,
    @required this.onPressedStartSession,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/mama_smile_512.png",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Kamu butuh bantuan Mama?',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  LongRaisedButton(
                    height: 50,
                    dividedBy: 1.2,
                    onPressed: onPressedStartSession,
                    child: const CustomText(
                      "Chat Sekarang",
                      color: Configs.backgroundColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
