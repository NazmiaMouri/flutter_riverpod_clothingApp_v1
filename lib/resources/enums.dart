import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Sizes {
  @JsonValue('S') small,
  @JsonValue('M') medium,
  @JsonValue('L') large,
  @JsonValue('XL') extraLarge,
}


@JsonEnum()
enum Category {
  kurti,
  suit,
  pant,
}

@JsonEnum()
enum OrderStatus {
  @JsonValue('pending')
  pending,

  @JsonValue('shipped')
  shipped,

  @JsonValue('delivered')
  delivered,

  @JsonValue('cancelled')
  cancelled,
}
