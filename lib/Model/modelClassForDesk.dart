// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelClassForDesk {
  double price;
  String heading;
  String description;
  String id;
  String image;

  ModelClassForDesk({
    required this.price,
    required this.heading,
    required this.description,
    required this.id,
    required this.image,
  });

  ModelClassForDesk copyWith({
    double? price,
    String? heading,
    String? description,
    String? id,
    String? image,
  }) {
    return ModelClassForDesk(
      price: price ?? this.price,
      heading: heading ?? this.heading,
      description: description ?? this.description,
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'price': price,
      'heading': heading,
      'description': description,
      'id': id,
      'image': image,
    };
  }

  factory ModelClassForDesk.fromMap(Map<String, dynamic> map) {
    return ModelClassForDesk(
      price: map['price'] as double,
      heading: map['heading'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelClassForDesk.fromJson(String source) =>
      ModelClassForDesk.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelClassForDesk(price: $price, heading: $heading, description: $description, id: $id, image: $image)';
  }
}
