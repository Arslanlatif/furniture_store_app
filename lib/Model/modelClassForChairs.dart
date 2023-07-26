// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelClassForChairs {
  String heading;
  String image;
  String description;
  String id;
  double price;

  ModelClassForChairs({
    required this.heading,
    required this.image,
    required this.description,
    required this.id,
    required this.price,
  });

  ModelClassForChairs copyWith({
    String? heading,
    String? image,
    String? description,
    String? id,
    double? price,
  }) {
    return ModelClassForChairs(
      heading: heading ?? this.heading,
      image: image ?? this.image,
      description: description ?? this.description,
      id: id ?? this.id,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'heading': heading,
      'image': image,
      'description': description,
      'id': id,
      'price': price,
    };
  }

  factory ModelClassForChairs.fromMap(Map<String, dynamic> map) {
    return ModelClassForChairs(
      heading: map['heading'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelClassForChairs.fromJson(String source) =>
      ModelClassForChairs.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelClassForChairs(heading: $heading, image: $image, description: $description, id: $id, price: $price)';
  }
}
