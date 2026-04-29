import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/network/api_client.dart';
import 'package:flutter_firebase_ecommerce/network/header_requesttime.dart';
import 'package:retrofit/retrofit.dart';

class ProductRepository {
  late RestClient _apiRequest;

  ProductRepository() {
    //RestClient take a dio object so i made a singleton dio class which is named  /// HeaderRequestTime ///
    //because i declare the header, content type, request time out under this singleton class.
    _apiRequest = RestClient(HeaderRequestTime.instance);
  }
  Future<List<Dress>> getAllDress() {
    return _apiRequest.getAllDress();
  }

  // Future<Dress> getDress(String productId) {
  //   return _apiRequest.getDress(productId);
  // }
}

final productRepo = ProductRepository();
