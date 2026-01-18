import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderService {
  final _db = FirebaseFirestore.instance.collection('orders');

  Future<void> createOrder(List items, double total) async {
    final user = FirebaseAuth.instance.currentUser;

    await _db.add({
      'userId': user!.uid,
      'items': items,
      'total': total,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> userOrders(String uid) {
    return _db
        .where('userId', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
