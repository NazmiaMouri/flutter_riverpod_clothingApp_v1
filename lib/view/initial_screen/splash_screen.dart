import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/repository/auth_repository.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.pushNamed(context, '/startup');
    // });

    authRepo.auth().then((res) {
      var data = res;
      print(jsonEncode( data));
      if (data.email != null) {
        Navigator.pushNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/startup');
      }
    });

    super.initState();
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
