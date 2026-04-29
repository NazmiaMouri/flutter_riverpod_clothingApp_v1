// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      product: json['product'] == null
          ? null
          : Dress.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
