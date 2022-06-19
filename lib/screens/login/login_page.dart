import 'package:flutter/material.dart';
import 'package:flutter_impuls/configs/configs.dart';
import 'package:flutter_impuls/enums/page_name.dart';
import 'package:flutter_impuls/enums/user_hobby.dart';
import 'package:flutter_impuls/enums/user_profession.dart';
import 'package:flutter_impuls/functions/routes.dart';
import 'package:flutter_impuls/functions/toast_helper.dart';
import 'package:flutter_impuls/functions/token_version.dart';
import 'package:flutter_impuls/models/user/user.dart';
import 'package:flutter_impuls/widgets/custom/custom_text.dart';
import 'package:flutter_impuls/widgets/long_raised_button.dart';
import 'package:flutter_impuls/widgets/normal_form_field.dart';
import 'package:flutter_impuls/widgets/password_normal_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 10.0,
                  top: 20.0,
                  bottom: 10.0,
                ),
                child: Image.asset(
                  "assets/mama_logo.png",
                  width: 300,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
              child: CustomText(
                "Login ke Akunmu.",
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    'Belum Punya Akun ?',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                  TextButton(
                    onPressed: () {
                      Routes.pushReplacement(context, PageName.Register);
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            // side: BorderSide(color: Colors.red),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(0),
                        overlayColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 248, 231, 220)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(12.5))),
                    child: const CustomText(
                      'Registrasi',
                      fontSize: 15,
                      color: Configs.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 10.0),
              child: CustomText(
                'Email',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
              child: NormalFormField(
                hintText: "Masukkan email kamu",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 10.0),
              child: CustomText('Password',
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
              child: PasswordNormalFormField(
                hintText: "Masukkan password kamu",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 50.0),
              child: Center(
                child: LongRaisedButton(
                  height: 50,
                  dividedBy: 1.2,
                  onPressed: () {
                    User user = User(
                      id: "user@nasihatmama.com",
                      name: "Rachel Ginting",
                      email: "user@nasihatmama.com",
                      password: "123456",
                      profession: UserProfession.Artis,
                      hobbies: [
                        UserHobby.MakeUp,
                        UserHobby.Menonton,
                        UserHobby.MainGame,
                      ],
                    );

                    ToastHelper.show("Login Success", context);
                    TokenVersion.setEmailAndUser("user@nasihatmama.com", user);
                    Routes.pushReplacement(context, PageName.Home);
                  },
                  child: const CustomText(
                    "Login",
                    color: Configs.backgroundColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
