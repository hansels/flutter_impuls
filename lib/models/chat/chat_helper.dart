import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_impuls/models/chat/chat.dart';

class ChatHelper {
  final instance = FirebaseFirestore.instance;

  Stream<Iterable<Chat>> list(String sessionId) {
    return instance
        .collection('chats')
        .where('sessionId', isEqualTo: sessionId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) => Chat.fromMap(e.data())));
  }

  Future<void> create(Chat chat) async {
    await instance.collection('chats').doc().set(chat.toVariables());
  }

  Future<void> update(Chat chat) async {
    await instance.collection('chats').doc(chat.id).update(chat.toVariables());
  }

  Future<void> delete(Chat chat) async {
    await instance.collection('chats').doc(chat.id).delete();
  }
}
