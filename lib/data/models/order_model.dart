import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.userId,
    required super.total,
    required super.items,
    required super.createdAt,
    required super.status,
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

  factory OrderModel.fromMap(String id, Map<String, dynamic> map) {
    return OrderModel(
      id: id,
      userId: map['userId'] ?? '',
      total: (map['total'] as num?)?.toDouble() ?? 0.0,
      items: List<Map<String, dynamic>>.from(map['items'] ?? []),
      createdAt: map['createdAt'] != null 
          ? DateTime.parse(map['createdAt']) 
          : DateTime.now(),
      status: map['status'] ?? 'pending',
    );
  }
}
