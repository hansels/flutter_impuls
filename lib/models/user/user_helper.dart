import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_impuls/models/user/user.dart';

class UserHelper {
  final instance = FirebaseFirestore.instance;

  Future<void> createUser(User user) async {
    await instance.collection('users').doc(user.id).set(user.toVariables());
  }

  Future<void> updateUser(User user) async {
    await instance.collection('users').doc(user.id).update(user.toVariables());
  }

  Future<void> deleteUser(User user) async {
    await instance.collection('users').doc(user.id).delete();
  }

  Future<User> getUser(String id) async {
    final snapshot = await instance.collection('users').doc(id).get();
    return User.fromMap(snapshot.data());
  }

  Future<List<User>> getUsers() async {
    final snapshot = await instance.collection('users').get();
    return User.fromMapList(snapshot.docs.map((e) => e.data()).toList());
  }

  Future<List<User>> getUsersByName(String name) async {
    final snapshot =
        await instance.collection('users').where('name', isEqualTo: name).get();
    return User.fromMapList(snapshot.docs.map((e) => e.data()).toList());
  }
}
