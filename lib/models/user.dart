import 'dart:convert';

import 'package:flutter_firebase_ecommerce/models/address.dart';
import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/models/order.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'userName')
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  List<Address>? address;
  List<Dress>? wishlist;
  List<Cart>? cart;
  List<OrderDetails>? orders;

  User(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.address,
      this.wishlist,
      this.cart,
      this.orders});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
    List<Address>? address,
    List<Dress>? wishlist,
    List<Cart>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      address: address ?? this.address,
      wishlist: wishlist ?? this.wishlist,
      cart: cart ?? this.cart,
    );
  }
}
