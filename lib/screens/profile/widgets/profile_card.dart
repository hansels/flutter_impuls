import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_impuls/configs/configs.dart';
import 'package:flutter_impuls/functions/token_version.dart';
import 'package:flutter_impuls/widgets/builder/user_builder.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return UserBuilder(builder: (user) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Card(
          color: const Color.fromARGB(255, 247, 253, 255),
          elevation: 2.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 252, 198, 179),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Image.asset(
                        'assets/person.png',
                        width: 100,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0.0),
                        child: CustomText(
                          user.name,
                          fontSize: 28,
                          color: Colors.black87,
                        ),
                      ),
                      CustomText(
                        user.email ?? "email@email.com",
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
