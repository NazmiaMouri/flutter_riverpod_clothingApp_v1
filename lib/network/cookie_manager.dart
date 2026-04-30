import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CookieManager extends Interceptor {
  static final CookieManager _instance = CookieManager._internal();
  static CookieManager get instance => _instance;
  CookieManager._internal();

  String? _cookie;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      if (response.headers.map['set-cookie'] != null) {
        var cookie_string = response.headers.map['set-cookie']?[0];
        var cookie = cookie_string!.split(';').first.split('=').last;
        print('=================================Cookie: $cookie');
        _saveCookie(cookie);
      }
    } else if (response.statusCode == 401) {
      _clearCookie();
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response!.statusCode == 401) {
      _clearCookie();
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Cookie'] = _cookie;
    return super.onRequest(options, handler);
  }

  Future<void> getCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _cookie = prefs.getString('cookie');
  }

  void _saveCookie(String newCookie) async {
    if (_cookie != newCookie) {
      _cookie = newCookie;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('cookie', _cookie!);
    }
  }

  void _clearCookie() async {
    _cookie = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cookie');
  }
}
