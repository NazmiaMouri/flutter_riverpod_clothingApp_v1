import 'package:flutter_firebase_ecommerce/models/auth_request.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/models/user.dart';
import 'package:flutter_firebase_ecommerce/network/api_client.dart';
import 'package:flutter_firebase_ecommerce/network/cookie_manager.dart';
import 'package:flutter_firebase_ecommerce/network/header_requesttime.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  late RestClient _apiRequest;

  AuthRepository() {
    //RestClient take a dio object so i made a singleton dio class which is named  /// HeaderRequestTime ///
    //because i declare the header, content type, request time out under this singleton class.
    _apiRequest = RestClient(HeaderRequestTime.instance);
  }

  Future<User> auth() {
    return _apiRequest.auth();
  }

  Future<void> signUp(User user) {
    return _apiRequest.signUp(user);
  }

  Future<String> login(LoginRequest loginRequest) {
    return _apiRequest.login(loginRequest);
  }

  Future<void> logout() async {
    await CookieManager.instance.clearCookie();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    return _apiRequest.logout();
  }
}

final authRepo = AuthRepository();
