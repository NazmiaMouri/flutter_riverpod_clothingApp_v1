import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/models/rating.dart';
import 'package:flutter_firebase_ecommerce/providers/user_provider.dart';
import 'package:flutter_firebase_ecommerce/repository/order_repository.dart';
import 'package:flutter_firebase_ecommerce/repository/product_repository.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/resources/enums.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/toast_service.dart';
import 'package:go_router/go_router.dart';

class ViewProductDetail extends ConsumerStatefulWidget {
  final Dress dress;
  const ViewProductDetail({super.key, required this.dress});

  @override
  ConsumerState<ViewProductDetail> createState() => _ViewProductDetailState();
}

class _ViewProductDetailState extends ConsumerState<ViewProductDetail> {
  List<Rating> ratingStar = [
    Rating(),
    Rating(),
    Rating(),
    Rating(),
    Rating(),
  ];

  double ratingNumber = 0;
  int quantity = 1;
  late Dress dress;

  Sizes selection = Sizes.small;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    dress = widget.dress;
    isFavorite = dress.favourite;
    ratingNumber = dress.rating ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/lime_blue_blur.png'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          // Handle favorite action
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.95,
                child: DraggableScrollableSheet(
                    initialChildSize: 0.5, // Initial size of the sheet
                    minChildSize:
                        0.5, // Minimum size the sheet can be dragged to
                    maxChildSize: 0.5,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dress.title!,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    dress.price?.toString() ?? '0',
                                    style: const TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  ratingNumber >= 2
                                      ? Icon(Icons.star_outlined, color: rating)
                                      : Icon(Icons.star_outline_outlined,
                                          color: rating),
                                  ratingNumber >= 3
                                      ? Text(
                                          '$ratingNumber',
                                          style: const TextStyle(fontSize: 15),
                                        )
                                      : Text(
                                          'No ratings',
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                  InkWell(
                                    child: Text(
                                      dress.reviews != null
                                          ? ' (${dress.reviews!.length} reviews)'
                                          : ' (0 review)',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () => setState(() {
                                          quantity -= 1;
                                        }),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Icon(
                                            Icons.remove_outlined,
                                          ),
                                        ),
                                      ),
                                      const VerticalDivider(
                                        width: 0,
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          '$quantity',
                                          style: const TextStyle(fontSize: 24),
                                        ),
                                      ),
                                      const VerticalDivider(
                                        width: 0,
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                        color: Colors.grey,
                                      ),
                                      InkWell(
                                        onTap: () => setState(() {
                                          quantity += 1;
                                        }),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Icon(
                                            Icons.add_outlined,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('DESCRIPTION'),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text('Paragraph'),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('SELECT SIZE'),
                              SegmentedButton<Sizes>(
                                segments: const <ButtonSegment<Sizes>>[
                                  ButtonSegment<Sizes>(
                                      value: Sizes.small, label: Text('S')),
                                  ButtonSegment<Sizes>(
                                      value: Sizes.medium, label: Text('M')),
                                  ButtonSegment<Sizes>(
                                    value: Sizes.large,
                                    label: Text('L'),
                                  ),
                                  ButtonSegment<Sizes>(
                                      value: Sizes.extraLarge,
                                      label: Text('XL')),
                                ],
                                selected: <Sizes>{selection},
                                onSelectionChanged: (Set<Sizes> newSelection) {
                                  setState(() {
                                    selection = newSelection.first;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.straighten,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Show size chart',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: filledButton(
                                    context: context,
                                    buttonName: 'ADD TO CART',
                                    buttonColour: Colors.black,
                                    buttonAction: () {
                                      print(jsonEncode(dress));
                                      orderRepo
                                          .addCartItem(Cart(
                                        product: dress,
                                        quantity: quantity,
                                      ))
                                          .then((_) {
                                        ToastService.showSuccess(
                                            'Item added to cart');

                                        ref
                                            .read(userProvider.notifier)
                                            .addCartItems(Cart(
                                              product: dress,
                                              quantity: quantity,
                                            ));
                                      }).catchError((error) {
                                        ToastService.showError(
                                            'Failed to add item to cart');
                                      });
                                    }),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ],
      ),
    ));
  }
}

mixin favourite {}
