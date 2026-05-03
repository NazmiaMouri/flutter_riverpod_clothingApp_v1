import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/resources/extensions.dart';

class CartItem extends StatefulWidget {
  final Cart cartItem;
  final VoidCallback onselection;
  const CartItem({super.key, required this.cartItem, required this.onselection});
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isChecked = false;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    quantity = widget.cartItem.quantity ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    print('=============================Cart Item:');
    print(jsonEncode(widget.cartItem));
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
              widget.onselection();
            },
          ),
          Container(
            color: Colors.amber,
            width: 120,
            height: 90,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.cartItem.product?.title ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(widget.cartItem.product?.size?.code ?? ''),
              Text('\$${widget.cartItem.product?.price ?? 'Price is missing'}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            height: 25,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[200]!,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      quantity -= 1;
                    }),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Icon(
                        Icons.remove_outlined,
                        size: 15,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 0,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.grey[200]!,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  VerticalDivider(
                    width: 0,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.grey[200]!,
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      quantity += 1;
                    }),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Icon(
                        Icons.add_outlined,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
