import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/resources/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderDetails {
  @JsonKey(name: '_id')
  String? id;

  String? orderId;

  List<Cart>? products;

  double? totalPrice;

  OrderStatus? status;

  String? createdAt;
  String? updatedAt;

  OrderDetails({
    this.id,
    this.orderId,
    this.products,
    this.totalPrice,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}


