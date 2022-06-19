import 'package:flutter/material.dart';
import 'package:flutter_impuls/enums/user_hobby.dart';
import 'package:flutter_impuls/enums/user_profession.dart';
import 'package:flutter_impuls/functions/enum_parser.dart';

class User with ChangeNotifier {
  static User _empty;

  final String id;
  final String name;
  final String email;
  final String password;
  final UserProfession profession;
  final List<UserHobby> hobbies;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.profession,
    this.hobbies,
  }) : assert(name != null || name.isNotEmpty);

  static User empty() {
    return _empty ??= User(name: "EMPTY");
  }

  bool get isEmpty => this == User.empty();

  static User fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : User(
            id: data["id"] ?? "",
            name: data["name"] ?? "",
            email: data["email"] ?? "",
            password: data["password"] ?? "",
            profession: EnumParser.getEnum<UserProfession>(
                UserProfession.values, data["profession"]),
            hobbies: data["hobbies"] != null
                ? List.from(data["hobbies"]
                    ?.map((e) =>
                        EnumParser.getEnum<UserHobby>(UserHobby.values, e))
                    ?.toList())
                : [],
          );
  }

  static List<User> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  String getFirstName() {
    return name.split(" ")[0];
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "profession": EnumParser.getString(profession),
      "hobbies": hobbies.map((e) => EnumParser.getString(e)).toList(),
    };
  }
}
