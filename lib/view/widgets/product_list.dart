import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/repository/product_repository.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/product_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: productRepo.getAllDress(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            );
          } else if (snapshot.hasError || snapshot.data.isEmpty) {
            return const SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            );
          } else {
            final List<Dress> dresses = snapshot.data;
            return GridView.builder(
                itemCount: dresses.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: .7),
                itemBuilder: (_, int index) {
                  final dress = dresses[index];
                  return InkWell(
                      onTap: () => context.push('/productDetail', extra: dress),
                      child: Product(
                        dress: dress,
                      ));
                });
          }
        });
  }
}
