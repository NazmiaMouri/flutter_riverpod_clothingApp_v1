import 'package:json_annotation/json_annotation.dart';

part 'reviews.g.dart';

@JsonSerializable()
class Review {
  String? userId;
  String? comment;
  Review({
    this.userId,
    this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) =>
      _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}