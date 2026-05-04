import 'dart:convert';

import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

final userProvider =
    StateNotifierProvider<UserController, User?>((ref) {
  return UserController();
});

class UserController extends StateNotifier<User?> {
  UserController() : super(null);

  // 🔹 login / set user
  void setUser(User user) {
    print(jsonEncode(user));
    state = user;
  }

  // 🔹 update user fields safely
  void updateUser(User updated) {
    state = updated;
  }

  // 🔹 update user cart safely
  void addCartItems(Cart cartItem) {
    print(cartItem);
    if (state != null) {
      final updatedUser = state!.copyWith(
        cart: [...(state!.cart ?? []), cartItem],
      );
      state = updatedUser;
    }
  }
  // delete items from cart
  void deleteCartItems(List<Cart> cartItems) {
    if (state != null) {
      final updatedCart = state!.cart?.where((item) => !cartItems.contains(item)).toList();
      final updatedUser = state!.copyWith(cart: updatedCart);
      state = updatedUser;
    }
  }

  // 🔹 logout
  void logout() {
    state = null;
  }

  // 🔹 helper
  bool get isLoggedIn => state != null;
}