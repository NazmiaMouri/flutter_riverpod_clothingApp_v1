import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isChecked = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
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
            },
          ),
          Container(
            color: Colors.amber,
            width: 120,
            height: 90,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Product Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Size: M'),
              Text('\$100.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            height: 25,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]!,),
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
