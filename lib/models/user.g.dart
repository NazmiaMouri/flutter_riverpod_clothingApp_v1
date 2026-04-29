// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      wishlist: (json['wishlist'] as List<dynamic>?)
          ?.map((e) => Dress.fromJson(e as Map<String, dynamic>))
          .toList(),
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'address': instance.address,
      'wishlist': instance.wishlist,
      'cart': instance.cart,
    };
