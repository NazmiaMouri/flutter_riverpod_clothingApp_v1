import 'package:flutter_firebase_ecommerce/models/address.dart';
import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  List<Address>? address;
  List<Dress>? wishlist;
  List<Cart>? cart;


  User({this.name, this.email, this.phoneNumber, this.password, this.address, this.wishlist, this.cart});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
