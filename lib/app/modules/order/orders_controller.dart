import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/services/order_service.dart';

class OrdersController extends GetxController {
  final OrderService _service = OrderService();
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Stream get orders => _service.userOrders(uid);
}
