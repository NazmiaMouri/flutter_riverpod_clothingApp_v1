import 'package:flutter_firebase_ecommerce/resources/enums.dart';

extension SizesX on Sizes {
  String get code => switch (this) {
        Sizes.small => "S",
        Sizes.medium => "M",
        Sizes.large => "L",
        Sizes.extraLarge => "XL",
      };

 
}