import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class ProductService {
  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async {
    final snapshot = await _db
        .collection('products')
        .where('isActive', isEqualTo: true)
        .get();

    return snapshot.docs
        .map((doc) => ProductModel.fromMap(doc.id, doc.data()))
        .toList();
  }
}