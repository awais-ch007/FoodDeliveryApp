import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrdertoDatabase(String receipt) async {
    await orders.add({'date': DateTime.now(), 'receipt': receipt});
  }
}
