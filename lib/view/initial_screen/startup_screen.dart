import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/outlined_button.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/font.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            brandText(
                text: 'Al - Maequl',
                style: const TextStyle(
                  color: brandTextolor,
                  fontSize: 48,
                )),
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/images/lady_sewing.png",
              width: 280,
              height: 320,
            ),
            Text('Fashion is not luxury anymore..',
                style: GoogleFonts.allura(
                  color: Colors.black,
                  fontSize: 24,
                )),
            const SizedBox(
              height: 50,
            ),
            outLinedButton(
                context: context,
                buttonName: 'Login',
                buttonColour: Colors.black,
                buttonAction: () => context.go('/loginWithEmail')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: const Divider(
                        color: Colors.black,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'or',
                        style: const TextStyle(fontSize: 18),
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: const Divider(color: Colors.black)),
                ],
              ),
            ),
            filledButton(
                context: context,
                buttonName: 'Register',
                buttonColour: Colors.black,
                buttonAction: () => context.go('/register'))
          ]),
        ),
      ),
    );
  }
}
