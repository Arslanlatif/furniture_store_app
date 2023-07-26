// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelClassForAddToCart {
  double price;
  String heading;
  String description;
  String id;
  String image;
  int quantity;

  ModelClassForAddToCart({
    required this.price,
    required this.heading,
    required this.description,
    required this.id,
    required this.image,
    required this.quantity,
  });

  ModelClassForAddToCart copyWith({
    double? price,
    String? heading,
    String? description,
    String? id,
    String? image,
    int? quantity,
  }) {
    return ModelClassForAddToCart(
      price: price ?? this.price,
      heading: heading ?? this.heading,
      description: description ?? this.description,
      id: id ?? this.id,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'heading': heading,
      'description': description,
      'id': id,
      'image': image,
      'quantity': quantity,
    };
  }

  factory ModelClassForAddToCart.fromMap(Map<String, dynamic> map) {
    return ModelClassForAddToCart(
      price: map['price']?.toDouble() ?? 0.0,
      heading: map['heading'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelClassForAddToCart.fromJson(String source) =>
      ModelClassForAddToCart.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelClassForAddToCart(price: $price, heading: $heading, description: $description, id: $id, image: $image, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelClassForAddToCart &&
        other.price == price &&
        other.heading == heading &&
        other.description == description &&
        other.id == id &&
        other.image == image &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return price.hashCode ^
        heading.hashCode ^
        description.hashCode ^
        id.hashCode ^
        image.hashCode ^
        quantity.hashCode;
  }
}
