class OrderEntity {
  final String id;
  final String userId;
  final double total;
  final List<Map<String, dynamic>> items;
  final DateTime createdAt;
  final String status;

  OrderEntity({
    required this.id,
    required this.userId,
    required this.total,
    required this.items,
    required this.createdAt,
    required this.status,
  });
}
