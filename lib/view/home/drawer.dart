import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/network/cookie_manager.dart';
import 'package:flutter_firebase_ecommerce/repository/auth_repository.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/circle_image.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/list_tile.dart';
import 'package:go_router/go_router.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({required this.closeEndDrawer, super.key});

  final Function closeEndDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: brand,
      child: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: InkWell(
                  onTap: () => closeEndDrawer(),
                  child: const Icon(
                    Icons.close_outlined,
                  ),
                ),
              ),
            ),
            listTile(
              context,
              width: 160,
              leading: Align(
                alignment: Alignment.centerLeft,
                child: CircularImageWithBackground(
                  foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
                ),
              ),
              title: 'Nazmia Tamanna Mouri',
              subtitle: 'nazmiatamannamouri@gmail.com',
              trailing: const Icon(
                Icons.edit_outlined,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            drawerItems(Icons.shopping_basket_outlined, 'Orders',
                () => {context.push('/order')}),
            drawerItems(Icons.favorite_border_outlined, 'Wishlist',
                () => {context.push('/wishlist')}),
            drawerItems(Icons.place_outlined, 'Delivery Address',
                () => {context.push('/address')}),
            drawerItems(Icons.payment_outlined, 'Payment Methods', () => {}),
            drawerItems(Icons.sell_outlined, 'Promo Card', () => {}),
            drawerItems(
                Icons.notifications_outlined, 'Notifications', () => {}),
            drawerItems(Icons.help_outline_outlined, 'Help', () => {}),
            drawerItems(Icons.info_outlined, 'About', () => {}),

            const Spacer(), // <-- This will fill up any free-space
            // Everything from here down is bottom aligned in the drawer
            drawerItems(
                Icons.logout_outlined,
                'LOG OUT',
                () => {
                      authRepo
                          .logout()
                          .then((value) => context.go('/loginWithEmail'))
                    }),
          ],
        ),
      ),
    );
  }

  Widget drawerItems(IconData iconName, String itemName, Function itemAction) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: InkWell(
        onTap: () => itemAction(),
        child: Row(
          children: [Icon(iconName), const SizedBox(width: 20), Text(itemName)],
        ),
      ),
    );
  }
}
