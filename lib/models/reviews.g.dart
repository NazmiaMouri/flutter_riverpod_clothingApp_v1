// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      userId: json['userId'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'userId': instance.userId,
      'comment': instance.comment,
    };
