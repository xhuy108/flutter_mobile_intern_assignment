class Product {
  int id;
  String image;
  String name;
  String description;
  double price;
  String color;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      color: json['color'],
    );
  }
}
