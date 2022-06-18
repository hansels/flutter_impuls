import 'package:flutter/material.dart';

class User with ChangeNotifier {
  static User _empty;

  final String id;
  final String name;
  final String email;
  final String password;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
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
          );
  }

  static List<User> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
    };
  }
}
