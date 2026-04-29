import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/view/home/drawer.dart';
import 'package:flutter_firebase_ecommerce/view/tab_view/popular_items.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/circle_image.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/font.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void openEndDrawer() {
      scaffoldKey.currentState!.openEndDrawer();
    }

    void closeEndDrawer() {
     context.pop();
    }

    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Container(
              height: 50,
              width: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/needle.png',
                ),
              )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: brandText(
                        text: 'Al - Maequl',
                        style: const TextStyle(
                            fontSize: 20, color: brandTextolor)),
                  ),
                  malabisCollectionText(fontSize: 6, letterSpacing: 2),
                ],
              ),
            ),
            actions: [
              const InkWell(
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.notifications_outlined,
                  ),
                ),
              ),
              const InkWell(
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
              ),
              const InkWell(
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.favorite_border_outlined,
                  ),
                ),
              ),
              const InkWell(
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
              InkWell(
                onTap: () => openEndDrawer(),
                child: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.menu_outlined,
                  ),
                ),
              ),
            ],
            bottom: const TabBar(
              labelColor: tabBar,
              indicatorColor: tabBar,
              tabs: [
                Tab(
                  text: 'Popular',
                ),
                Tab(text: 'Kurti'),
                Tab(text: 'Suit'),
                Tab(text: 'Pant'),
                Tab(text: 'Offer'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PopularItems(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
          endDrawer: DrawerScreen(closeEndDrawer: closeEndDrawer)),
    );
  }
}
