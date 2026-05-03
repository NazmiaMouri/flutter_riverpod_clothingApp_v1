import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/providers/order_provider.dart';
import 'package:flutter_firebase_ecommerce/resources/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(ordersProvider);

    return ordersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text(err.toString())),
      data: (orders) {
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return orderTile(
              orderId: order.orderId ?? '',
              products: order.products ?? [],
              date: order.createdAt ?? '',
              orderStatus: order.status ?? OrderStatus.pending,
              amount: '${order.totalPrice ?? 0}',
            );
          },
        );
      },
    );
  }
}

Widget orderTile(
    {required String orderId,
    required List<Cart> products,
    required String date,
    required OrderStatus orderStatus,
    required String amount}) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(orderId),
            // const Icon(
            //   Icons.content_copy,
            // ),
            Column(
              children: [
                Text(orderStatus.name.toUpperCase()),
                Text(DateFormat.yMMMd().format(DateTime.parse(date))),
                const SizedBox(
                  height: 20,
                ),
                Text(amount)
              ],
            )
          ],
        ),
        const Divider(),
        const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.list_alt,
                  ),
                  Text('Details'),
                ],
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_bag,
                  ),
                  Text('Reorder'),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
