import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/cart_item.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';
import 'package:go_router/go_router.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('My Cart'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.delete))],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        ...List.generate(5, (index) => CartItem()),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Enter Coupon Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 100,
              child: filledButton(
                  context: context,
                  buttonName: 'Apply',
                  buttonColour: Colors.black,
                  buttonAction: () {}),
            )
          ],
        ),
        const SizedBox(height: 10),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('\$500.00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('\$20.00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
          Divider(
          thickness: 1,
          color: Colors.grey[300],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('\$520.00',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ])),
    );
  }
}
