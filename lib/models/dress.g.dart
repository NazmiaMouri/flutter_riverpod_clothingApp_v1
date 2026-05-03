// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dress _$DressFromJson(Map<String, dynamic> json) => Dress(
      json['_id'] as String?,
      json['body'] as String?,
      json['countInStock'] as num?,
      json['image'] as String?,
      json['title'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['favourite'] as bool? ?? false,
      (json['rating'] as num?)?.toDouble(),
      $enumDecodeNullable(_$SizesEnumMap, json['availableSizes'],
          unknownValue: Sizes.medium),
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecodeNullable(_$CategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$DressToJson(Dress instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'category': _$CategoryEnumMap[instance.category],
      'image': instance.image,
      'body': instance.body,
      'countInStock': instance.countInStock,
      'favourite': instance.favourite,
      'price': instance.price,
      'rating': instance.rating,
      'availableSizes': _$SizesEnumMap[instance.size],
      'reviews': instance.reviews,
    };

const _$SizesEnumMap = {
  Sizes.small: 'S',
  Sizes.medium: 'M',
  Sizes.large: 'L',
  Sizes.extraLarge: 'XL',
};

const _$CategoryEnumMap = {
  Category.kurti: 'kurti',
  Category.suit: 'suit',
  Category.pant: 'pant',
};
