import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String? label;
  String? city;
  String? country;
  String? postalCode;
  String? houseNo;
  String? roadNo;
  String? area;
  String? noteToRider;

  Address({this.label, this.city, this.country, this.postalCode, this.houseNo, this.roadNo, this.area, this.noteToRider});

factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
} 