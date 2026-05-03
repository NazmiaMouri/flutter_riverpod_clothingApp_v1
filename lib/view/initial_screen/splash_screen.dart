import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/network/cookie_manager.dart';
import 'package:flutter_firebase_ecommerce/providers/user_provider.dart';
import 'package:flutter_firebase_ecommerce/repository/auth_repository.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initVerification();
  }

  void initVerification() async {
    print('Checking for existing session...');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cookie = prefs.getString('cookie');
    if (cookie != null) {
      authRepo.auth().then((res) {
        var data = res;
        print('Auth Result:');
        print(res);
        print(jsonEncode(data));
        if (data.email != null) {
          ref.read(userProvider.notifier).setUser(data);
          context.go('/home');
        } else {
          context.go('/startup');
        }
      }).catchError((error) async {
        print('Auth Error: $error');
        await CookieManager.instance.clearCookie();

        await prefs.clear();
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Session Expired'),
            content: const Text(
              'Your authorization has failed. Please log in again.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop(); // close dialog
                  context.go('/loginWithEmail'); // redirect to login
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    } else {
      // No cookie found, navigate to startup
      context.go('/startup');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: brand,
        child: Center(
          child: Image.asset('assets/images/brand_logo.png'),
        ));
  }
}
