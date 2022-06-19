import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_impuls/models/bank/bank.dart';

class BankHelper {
  final instance = FirebaseFirestore.instance;

  Future<Iterable<Bank>> getListByUserId(String userId) {
    return instance
        .collection('banks')
        .where('userId', isEqualTo: userId)
        .get()
        .then((snapshot) => snapshot.docs.map((e) => Bank.fromMap(e.data())));
  }
}
