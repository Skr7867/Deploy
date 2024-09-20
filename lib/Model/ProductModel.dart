class Product {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  // Convert a Product object to a JSON map.
  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'description': description,
        'price': price,
      };

  // Convert a JSON map to a Product object.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }
}
