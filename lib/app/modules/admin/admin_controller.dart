import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminController extends GetxController {
  var totalOrders = 0.obs;
  var totalRevenue = 0.0.obs;

  @override
  void onInit() {
    loadStats();
    super.onInit();
  }

  void loadStats() async {
    final snapshot =
    await FirebaseFirestore.instance.collection('orders').get();

    totalOrders.value = snapshot.docs.length;

    totalRevenue.value = snapshot.docs.fold(
      0.0,
          (sum, doc) => sum + doc['total'],
    );
  }
}
