// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      id: json['_id'] as String?,
      orderId: json['orderId'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'orderId': instance.orderId,
      'products': instance.products,
      'totalPrice': instance.totalPrice,
      'status': _$OrderStatusEnumMap[instance.status],
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.shipped: 'shipped',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};
