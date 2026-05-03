import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/models/order.dart';
import 'package:flutter_firebase_ecommerce/network/api_client.dart';
import 'package:flutter_firebase_ecommerce/network/header_requesttime.dart';
import 'package:retrofit/retrofit.dart';

class OrderRepository {
  late RestClient _apiRequest;

  OrderRepository() {
    //RestClient take a dio object so i made a singleton dio class which is named  /// HeaderRequestTime ///
    //because i declare the header, content type, request time out under this singleton class.
    _apiRequest = RestClient(HeaderRequestTime.instance);
  }
  Future<List<Cart>> getCartItems() {
    return _apiRequest.getCartItems();
  }

  Future<void> addCartItem(Cart cartItem) {
    return _apiRequest.addCartItem(cartItem);
  }

  Future<void> deleteCartItem(Cart cartItem) {
    return _apiRequest.deleteCartItem(cartItem);
  }

  Future<void> createOrder(OrderDetails order) {
    return _apiRequest.createOrder(order);
  }

  Future<List<OrderDetails>> getOrders() {
    return _apiRequest.getOrders();
  }
}

final orderRepo = OrderRepository();
