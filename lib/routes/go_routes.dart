import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/view/auth/login_with_email.dart';
import 'package:flutter_firebase_ecommerce/view/auth/login_with_phoneNumber.dart';
import 'package:flutter_firebase_ecommerce/view/auth/register.dart';
import 'package:flutter_firebase_ecommerce/view/drawer_items/address.dart';
import 'package:flutter_firebase_ecommerce/view/drawer_items/edit_address.dart';
import 'package:flutter_firebase_ecommerce/view/drawer_items/orders.dart';
import 'package:flutter_firebase_ecommerce/view/drawer_items/wishlist.dart';
import 'package:flutter_firebase_ecommerce/view/home/home.dart';
import 'package:flutter_firebase_ecommerce/view/initial_screen/splash_screen.dart';
import 'package:flutter_firebase_ecommerce/view/initial_screen/startup_screen.dart';
import 'package:flutter_firebase_ecommerce/view/product_details/product_details.dart';
import 'package:flutter_firebase_ecommerce/view/user/cart_list.dart';

import 'package:go_router/go_router.dart';

// import your screens here

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/startup',
      builder: (context, state) => const StartUpScreen(),
    ),
    GoRoute(
      path: '/loginWithEmail',
      builder: (context, state) => const LoginWithEmail(),
    ),
    GoRoute(
      path: '/loginWithPhone',
      builder: (context, state) => const LoginWithPhoneNumber(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const Register(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
       routes: [
        GoRoute(
          path: 'cart',
          builder: (context, state) => CartList(),
        ),
        // GoRoute(
        //   path: 'settings',
        //   builder: (context, state) => SettingsScreen(),
        // ),
      ],
    ),
    GoRoute(
      path: '/productDetail',
      builder: (context, state) {
        final dress = state.extra as Dress;
        return ViewProductDetail(dress: dress);
      },
    ),
    GoRoute(
      path: '/order',
      builder: (context, state) => const Orders(),
    ),
    GoRoute(
      path: '/wishlist',
      builder: (context, state) => const Wishlist(),
    ),
    GoRoute(
      path: '/address',
      builder: (context, state) => const Address(),
    ),
    GoRoute(
      path: '/editAddress',
      builder: (context, state) => const EditAddress(),
    ),
  ],
);
