import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_impuls/models/session/session.dart';

class SessionHelper {
  final instance = FirebaseFirestore.instance;

  Stream<Session> getSessionStream(String id) {
    return instance
        .collection('sessions')
        .where("userId", isEqualTo: id)
        .where("isActive", isEqualTo: true)
        .snapshots()
        .map((e) => Session.fromMap(e.docs.first.data()));
  }

  void endSession(String id) {
    instance
        .collection('sessions')
        .where("userId", isEqualTo: id)
        .where("isActive", isEqualTo: true)
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((doc) {
        instance.collection('sessions').doc(doc.id).update({"isActive": false});
      });
    });
  }

  Future<void> create(Session session) async {
    await instance.collection('sessions').doc().set(session.toVariables());
  }

  Future<void> update(Session session) async {
    await instance
        .collection('sessions')
        .doc(session.id)
        .update(session.toVariables());
  }
}
