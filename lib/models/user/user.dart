import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_impuls/functions/token_version.dart';

class User with ChangeNotifier {
  static User _empty;
  String id;
  String name;
  String classRoom;

  static final instance = FirebaseFirestore.instance;

  User({
    this.id,
    this.name,
    this.classRoom,
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
            classRoom: data["classRoom"] ?? "",
          );
  }

  static List<User> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "name": name,
      "classRoom": classRoom,
    };
  }

  Map<String, dynamic> toChatVariables() {
    return {"id": id, "name": name};
  }

  Future<void> update() async {
    await instance.collection('users').doc(id).update(toVariables());
  }

  Future<void> updateTokenVersionUser() async {
    await TokenVersion.setUser(this);
  }

  static Future<User> load(String uid) async {
    var document = await instance.collection('users').doc(uid).get();
    return User.fromMap(document.data());
  }
}
