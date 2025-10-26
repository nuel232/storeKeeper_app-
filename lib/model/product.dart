class Product {
  int? id;
  String name;
  double quantity;
  double price;
  String imagePath;

  Product({
    this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.imagePath,
  });

  // Convert to Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'imagePath': imagePath,
    };
  }

  // Create from Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      price: map['price'],
      imagePath: map['imagePath'],
    );
  }
}
