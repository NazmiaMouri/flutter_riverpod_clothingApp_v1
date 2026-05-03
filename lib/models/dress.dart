import 'package:flutter_firebase_ecommerce/models/reviews.dart';
import 'package:flutter_firebase_ecommerce/resources/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dress.g.dart';

@JsonSerializable()
class Dress {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  Category? category;
  String? image;
  String? body;
  num? countInStock;
  @JsonKey(defaultValue: false)
  final bool favourite;
  double? price;
  double? rating;
  @JsonKey(name: 'availableSizes', unknownEnumValue: Sizes.medium)
  Sizes? size;
  List<Review>? reviews;

  Dress(
      this.id,
      this.body,
      this.countInStock,
      this.image,
      this.title,
      this.price,
      this.favourite,
      this.rating,
      this.size,
      this.reviews,
      this.category);

  factory Dress.fromJson(Map<String, dynamic> json) => _$DressFromJson(json);

  Map<String, dynamic> toJson() => _$DressToJson(this);
}
