// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelClassForDetailOrder {
  double price;
  String heading;
  String description;
  String id;
  String image;
  int quantity;
  String number;
  String address;

  ModelClassForDetailOrder({
    required this.price,
    required this.heading,
    required this.description,
    required this.id,
    required this.image,
    required this.quantity,
    required this.number,
    required this.address,
  });

  ModelClassForDetailOrder copyWith({
    double? price,
    String? heading,
    String? description,
    String? id,
    String? image,
    int? quantity,
    String? number,
    String? address,
  }) {
    return ModelClassForDetailOrder(
      price: price ?? this.price,
      heading: heading ?? this.heading,
      description: description ?? this.description,
      id: id ?? this.id,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      number: number ?? this.number,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'price': price,
      'heading': heading,
      'description': description,
      'id': id,
      'image': image,
      'quantity': quantity,
      'number': number,
      'address': address,
    };
  }

  factory ModelClassForDetailOrder.fromMap(Map<String, dynamic> map) {
    return ModelClassForDetailOrder(
      price: map['price'] as double,
      heading: map['heading'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      image: map['image'] as String,
      quantity: map['quantity'] as int,
      number: map['number'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelClassForDetailOrder.fromJson(String source) =>
      ModelClassForDetailOrder.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelClassForDetailOrder(price: $price, heading: $heading, description: $description, id: $id, image: $image, quantity: $quantity, number: $number, address: $address)';
  }
}
