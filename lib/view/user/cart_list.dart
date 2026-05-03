import 'dart:convert';

import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/cart_item.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';
import 'package:go_router/go_router.dart';

class CartList extends ConsumerStatefulWidget {
  const CartList({super.key});

  // Future<List<CartItem>> fetchCartItems() async {
  //   // Simulating a network call to fetch cart items
  //   await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
  //   return List.generate(5, (index) => CartItem()); // Return a list of 5 cart items
  // }

  @override
  ConsumerState<CartList> createState() => _CartListState();
}

class _CartListState extends ConsumerState<CartList> {
  List<Cart> selectedItems = [];

  String calculateSubtotal() {
    final user = ref.watch(userProvider);
    final cartList = user!.cart ?? [];
    double subtotal = 0.0;
    for (var cartItem in cartList) {
      subtotal += (cartItem.product?.price ?? 0) * (cartItem.quantity ?? 1);
    }
    return subtotal.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final cartList = user!.cart ?? [];
    print('=============================Cart List:');
    print(jsonEncode(user));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('My Cart'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(userProvider.notifier).deleteCartItems(selectedItems);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            cartList.isEmpty
                ? const Center(child: Text("Cart is empty"))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      return CartItem(cartItem: cartList[index], onselection:(){
                        selectedItems.contains(cartList[index])
                            ? selectedItems.remove(cartList[index])
                            : selectedItems.add(cartList[index]);
                      });
                    },
                  ),
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
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('\$',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('\$20.00',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('\$${calculateSubtotal()}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            filledButton(
              width: double.infinity,
              context: context,
              buttonName: 'Proceed to Checkout',
              buttonColour: Colors.black,
              buttonAction: () {
                context.go('/checkout');
              },
            ),
          ])),
    );
  }
}
