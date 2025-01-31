class ProductModel {
  int? id;
  String category;
  String image;
  String brand;
  String itemName;
  String description;
  int price;
  int totalCount;
  int discount;

  ProductModel({
    this.id,
    required this.category,
    required this.image,
    required this.brand,
    required this.itemName,
    required this.description,
    required this.price,
    required this.totalCount,
    required this.discount,
  });

  // Factory constructor to create a Product from a map (from JSON)
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      category: map['category'],
      image: map['image'],
      brand: map['brand'],
      itemName: map['item_name'],
      description: map['description'],
      price: map['price'],
      totalCount: map['total_count'],
      discount: map['discount'],
    );
  }

  // Convert Product object to map (for sending to a server)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'image': image,
      'brand': brand,
      'item_name': itemName,
      'description': description,
      'price': price,
      'total_count': totalCount,
      'discount': discount,
    };
  }
}
