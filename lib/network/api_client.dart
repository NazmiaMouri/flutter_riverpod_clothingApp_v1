import 'package:dio/dio.dart';
import 'package:flutter_firebase_ecommerce/models/auth_request.dart';
import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/models/order.dart';
import 'package:flutter_firebase_ecommerce/models/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_firebase_ecommerce/resources/app_url.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: AppUrl.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/authchecking")
  Future<User> auth();

  @POST("/signup")
  Future<void> signUp(@Body() User user);

  @POST("/login")
  Future<String> login(@Body() LoginRequest loginRequest);

  @GET("/logout")
  Future<void> logout();

  @GET("/dresses")
  Future<List<Dress>> getAllDress();

  // @GET("/dresses/{productId}")
  // Future<Dress> getDress(@Path("productId") String productId);

  @GET("/cart")
  Future<List<Cart>> getCartItems();

  @POST("/cart/add")
  Future<String> addCartItem(@Body() Cart cartItem);

  @POST("/cart/remove")
  Future<String> deleteCartItem(@Body() Cart cartItem);

  @GET("/orders")
  Future<List<OrderDetails>> getOrders();

  @POST("/orders/create")
  Future<String> createOrder(@Body() OrderDetails order);
}
