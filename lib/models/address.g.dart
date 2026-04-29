// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      label: json['label'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      houseNo: json['houseNo'] as String?,
      roadNo: json['roadNo'] as String?,
      area: json['area'] as String?,
      noteToRider: json['noteToRider'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'label': instance.label,
      'city': instance.city,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'houseNo': instance.houseNo,
      'roadNo': instance.roadNo,
      'area': instance.area,
      'noteToRider': instance.noteToRider,
    };
