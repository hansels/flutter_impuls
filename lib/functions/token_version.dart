import 'dart:convert';

import 'package:flutter_impuls/models/user/user.dart';
import 'shared_preferences_function.dart';

class TokenVersion {
  final SharedPreferencesFunction _spHelper = SharedPreferencesFunction();

  String _email;
  bool _isTutorial;
  User _user;

  static Future<void> init() async {}

  static TokenVersion _instance;

  static TokenVersion get instance {
    return _instance ?? (_instance = TokenVersion());
  }

  static Future<bool> getIsTutorial() async {
    instance?._isTutorial ??=
        await instance._spHelper.getValueBool("isTutorial");
    return instance._isTutorial ?? false;
  }

  static Future<String> getEmail() async {
    instance?._email ??= await instance._spHelper.getValue('email');
    return instance._email ?? "";
  }

  static Future<User> getUser() async {
    if (instance._user == null) {
      var userString = await instance._spHelper.getValue('user');
      Map<String, dynamic> userMap;
      try {
        userMap = jsonDecode(userString);
      } catch (err) {
        userMap = null;
      }
      instance._user = (userMap == null ? User.empty() : User.fromMap(userMap));
    }
    return instance._user;
  }

  static Future<String> getUserId() async {
    var user = await getUser();
    return user?.id;
  }

  static Future<void> setEmailAndUser(String email, User user) async {
    await instance._spHelper.setStringValue('email', email);
    await setUser(user);

    instance._email = email;
    instance._user = user;
  }

  static Future<void> setUser(User user) async {
    var userVariables = user.toVariables();
    var userString = jsonEncode(userVariables);
    await instance._spHelper.setStringValue('user', userString);
  }

  static Future<void> setIsTutorial(bool isTutorial) async {
    await instance._spHelper.setBoolValue('isTutorial', isTutorial);
  }

  static Future<void> clearTokenAndUser() async {
    await instance._spHelper.removeValue('user');
    await instance._spHelper.removeValue('email');
    instance._email = null;
    instance._user = null;
  }

  static Future<bool> hasUser() async {
    return (await getUser()) != null;
  }
}
