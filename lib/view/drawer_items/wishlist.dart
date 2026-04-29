import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';
import 'package:go_router/go_router.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body: Builder(builder: (context) {
        return ListView.builder(
            itemBuilder: (_, int index) => favTile(context), itemCount: 10);
      }),
    );
  }
}

Widget favTile(BuildContext context) {
  return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.network('', loadingBuilder: (context, child, progress) {
                //   return progress == null ? child : LinearProgressIndicator();
                // }),
                Image.asset(
                  'assets/images/profile_pic.png',
                  fit: BoxFit.contain,
                  width: 150,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('product name'), Text('stock status')],
                ),
                const Text('Amount')
              ],
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.arrow_right),
            )
          ],
        ),
      ),
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 15),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Checkout",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          child: const Icon(Icons.close),
                          onTap: () => context.pop(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Delivery"),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left),
                            label: const Text('Select Method'),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Payment"),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left),
                            label: const Text('Select Method'),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Promo Code"),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left),
                            label: const Text('Pick discount'),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Cost"),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left),
                            label: const Text('amount'),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'By placing an order you agree to our ',
                    ),
                    const Text(
                      'Terms And Conditions.',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    filledButton(
                        context: context,
                        buttonName: 'Place Order',
                        buttonColour: Colors.black,
                        buttonAction: () =>
                            context.push( '/home'))
                  ]));
            });
      });
}
