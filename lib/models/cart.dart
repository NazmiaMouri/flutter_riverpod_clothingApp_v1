import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'productId')
  Dress? product;
  int? quantity;

  Cart({this.id, this.product, this.quantity});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
