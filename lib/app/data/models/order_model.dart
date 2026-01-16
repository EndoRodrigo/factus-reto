class OrderModel {
  final String id;
  final String userId;
  final double total;
  final List<Map<String, dynamic>> items;
  final DateTime createdAt;
  final String status;

  OrderModel({
    required this.id,
    required this.userId,
    required this.total,
    required this.items,
    required this.createdAt,
    this.status = 'pending',
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'total': total,
      'items': items,
      'createdAt': createdAt.toIso8601String(),
      'status': status,
    };
  }
}
