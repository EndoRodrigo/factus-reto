import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final _db = FirebaseFirestore.instance.collection('products');

  Stream<QuerySnapshot> getProducts() {
    return _db.snapshots();
  }

  Future<void> createProduct(Map<String, dynamic> data) {
    return _db.add(data);
  }

  Future<void> updateProduct(String id, Map<String, dynamic> data) {
    return _db.doc(id).update(data);
  }

  Future<void> deleteProduct(String id) {
    return _db.doc(id).delete();
  }
}
