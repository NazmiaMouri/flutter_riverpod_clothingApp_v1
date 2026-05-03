import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/user.dart';
import 'package:flutter_firebase_ecommerce/repository/auth_repository.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/debug_print.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/font.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/toast.dart';
import 'package:flutter_firebase_ecommerce/view_model/firebase/firebase_db.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_debouncer/tap_debouncer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FocusNode userNameNode = FocusNode();
  FocusNode phoneNumberNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FocusNode addressNode = FocusNode();

  final TextEditingController userName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: brand,
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 10),
        shrinkWrap: true,
        children: [
          Container(
            color: brand,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Get's started with",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
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
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: brandText(
                                    text: 'Al - Maequl',
                                    style: const TextStyle(
                                        fontSize: 24, color: brandTextolor)),
                              ),
                              malabisCollectionText(fontSize: 8)
                            ],
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(color: textAsh),
                      ),
                      InkWell(
                          onTap: () =>
                          context.go('/loginWithEmail'),
                          child: Text('Log in',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )))
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListView(
            physics: ClampingScrollPhysics(), // for nested scrolling
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shrinkWrap: true,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: userName,
                focusNode: userNameNode,
                decoration: const InputDecoration(hintText: 'Enter your name'),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Phone number',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneNumber,
                focusNode: phoneNumberNode,
                decoration:
                    const InputDecoration(hintText: 'Enter your phone number'),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email address',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: email,
                focusNode: emailNode,
                decoration: const InputDecoration(hintText: 'Enter email'),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: password,
                focusNode: passwordNode,
                decoration: const InputDecoration(hintText: 'Enter password'),
              ),
              SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Confirm password',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: confirmPassword,
                focusNode: confirmPasswordNode,
                decoration: const InputDecoration(hintText: 'Confirm password'),
              ),
              SizedBox(height: 20),
              TapDebouncer(
                onTap: () async {
                  try {
                    if (password.text == confirmPassword.text) {
                      // final resp = await FirebaseAuth.instance
                      //     .createUserWithEmailAndPassword(
                      //   email: email.text,
                      //   password: password.text,
                      // );
                      // User user = User(
                      //   name: userName.text,
                      //   email: email.text,
                      //   phoneNumber: phoneNumber.text,
                      // );
                      // DebugPrint(resp);
                      // createUserCollection(user);
                      User user = User(
                          name: userName.text,
                          email: email.text,
                          phoneNumber: phoneNumber.text,
                          password: password.text);

                      authRepo.signUp(user);

                      if (!context.mounted) return;
                      context.go('/loginWithEmail');
                    } else {
                      ShowToast.errorToast(
                          'Password and confirm password is not identical');
                    }
                  }catch (e) {
                    ShowToast.errorToast(e.toString());
                  }
                }, // your tap handler moved here
                builder: (BuildContext context, TapDebouncerFunc? onTap) {
                  return filledButton(
                      context: context,
                      buttonName: 'Register',
                      buttonColour: Colors.black,
                      buttonAction: onTap);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
