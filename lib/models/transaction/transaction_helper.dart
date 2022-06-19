import 'package:cloud_firestore/cloud_firestore.dart' as fire;
import 'package:flutter_impuls/models/transaction/transaction.dart';

class TransactionHelper {
  final instance = fire.FirebaseFirestore.instance;

  Future<Iterable<Transaction>> getListByUserId(String userId) {
    return instance
        .collection('transactions')
        .where('userId', isEqualTo: userId)
        .get()
        .then((snapshot) =>
            snapshot.docs.map((e) => Transaction.fromMap(e.data())));
  }
}
