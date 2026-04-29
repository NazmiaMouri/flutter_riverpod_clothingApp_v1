import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/auth_request.dart';
import 'package:flutter_firebase_ecommerce/repository/auth_repository.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/debug_print.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/font.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/toast.dart';
import 'package:flutter_firebase_ecommerce/view_model/firebase/user_data_handle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  bool isChecked = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  void signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      DebugPrint("Signed in with temporary account.   $userCredential");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          DebugPrint("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          DebugPrint('Unknown error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/lime_blue_blur.png',
      'assets/images/masterd_blue_blur.png',
      'assets/images/mustard _blur.png'
    ];
    return Scaffold(
      body: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 14,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/needle.png',
                      ),
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: brandText(
                              text: 'Al - Maequl',
                              style: TextStyle(
                                  fontSize: 24, color: brandTextolor)),
                        ),
                        malabisCollectionText(fontSize: 8)
                      ],
                    )),
                CarouselSlider(
                  options: CarouselOptions(height: 300.0, autoPlay: true),
                  items: images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          i,
                          fit: BoxFit.fill,
                        );
                      },
                    );
                  }).toList(),
                ),
                ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shrinkWrap: true,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: brandText(
                          text: 'Shop With Us',
                          style: TextStyle(
                            fontSize: 24,
                          )),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email address',
                      ),
                    ),
                    TextField(
                      controller: email,
                      focusNode: emailNode,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                      ),
                    ),
                    TextField(
                      controller: password,
                      focusNode: passwordNode,
                      decoration:
                          const InputDecoration(hintText: 'Enter password'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: brand,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Remeber me')
                          ],
                        ),
                        const Text(
                          'Forget password?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: filledButton(
                              context: context,
                              buttonName: 'Login',
                              buttonColour: Colors.black,
                              buttonAction: () {
                                LoginRequest loginRequest = LoginRequest(
                                    email: email.text, password: password.text);
                                authRepo.login(loginRequest).then((value) {
                                  var data = jsonDecode(value);
                                  print(data);
                                  if (data['user'] != null) {
                                    context.go('/home');
                                  }
                                });
                                //   buttonAction: () async {
                                //     try {
                                //       final credential = await FirebaseAuth.instance
                                //           .signInWithEmailAndPassword(email: email.text, password: password.text);
                                //       if (!context.mounted) return;
                                //       getUserDetail(email.text);
                                //       Navigator.pushNamed(context, '/home');
                                //     } on FirebaseAuthException catch (e) {
                                //       DebugPrint(e.code);
                                //       if (e.code == 'user-not-found') {
                                //         ShowToast.errorToast('No user found for that email.');
                                //       } else if (e.code == 'wrong-password') {
                                //         ShowToast.errorToast('Wrong password provided for that user.');
                                //       } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                                //         ShowToast.errorToast('INVALID LOGIN CREDENTIALS');
                                //       }
                                //     }
                                //   },
                                // ),
                              })),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Not yet registered? ',
                          style: TextStyle(color: textAsh),
                        ),
                        InkWell(
                            onTap: () => context.go('/register'),
                            child: Text('Create an account',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
