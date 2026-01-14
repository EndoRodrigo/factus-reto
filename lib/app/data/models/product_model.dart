class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final bool isActive;

  ProductModel({required this.id, required this.name, required this.description, required this.price, required this.imageUrl, required this.isActive});

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isActive': isActive,
    };
  }

  factory ProductModel.fromMap(String id, Map<String, dynamic> map){
    return ProductModel(
      id: id,
      name: map['name'],
      description: map['description'],
      price: (map['price'] as num).toDouble(),
      imageUrl: map['imageUrl'],
      isActive: map['isActive'],);
  }
}