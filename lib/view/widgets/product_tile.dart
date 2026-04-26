import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/repository/product_repository.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';

class Product extends StatelessWidget {
  final Dress dress;
  const Product({super.key, required this.dress});

  @override
  Widget build(BuildContext context) {
    print(jsonEncode(dress));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: brand,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dress.title!),
              const InkWell(
                child: Icon(
                  Icons.favorite_border_outlined,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(dress.price?.toString() ?? '0'),
        )
      ],
    );
  }
}
