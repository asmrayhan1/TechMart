class SellModel {
  int? id;
  String name;
  String email;
  int productId;
  String phone;
  String address;
  String productName;
  String description;
  String brand;
  String category;
  int price;
  int discount;

  SellModel({
    this.id,
    required this.name,
    required this.email,
    required this.productId,
    required this.phone,
    required this.address,
    required this.productName,
    required this.description,
    required this.price,
    required this.discount,
    required this.category,
    required this.brand,
  });

  // Factory constructor to create a Sell from a Map (from JSON)
  factory SellModel.fromMap(Map<String, dynamic> map) {
    return SellModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      productId: map['product_id'],
      phone: map['phone'],
      address: map['address'],
      productName: map['product_name'],
      description: map['description'],
      price: map['price'],
      discount: map['discount'],
      category: map['category'],
      brand: map['brand'],
    );
  }

  // Convert a Sell object into a Map (for sending to a server)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'product_id': productId,
      'phone': phone,
      'address': address,
      'product_name': productName,
      'description': description,
      'price': price,
      'discount': discount,
    };
  }
}