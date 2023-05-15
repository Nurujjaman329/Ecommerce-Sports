import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/models/cart_attributes.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItem {
    return _cartItems;
  }

  void addProductToCart(
      String productName,
      String productId,
      List imageUrl,
      int quantity,
      double price,
      String vendorId,
      String productSize,
      Timestamp scheduleDate) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCart) => CartAttr(
                productName: existingCart.productName,
                productId: existingCart.productId,
                imageUrl: existingCart.imageUrl,
                quantity: existingCart.quantity + 1,
                price: existingCart.price,
                vendorId: existingCart.vendorId,
                productSize: existingCart.productSize,
                scheduleDate: existingCart.scheduleDate,
              ));

      notifyListeners();
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartAttr(
              productName: productName,
              productId: productId,
              imageUrl: imageUrl,
              quantity: quantity,
              price: price,
              vendorId: vendorId,
              productSize: productSize,
              scheduleDate: scheduleDate));

      notifyListeners();
    }
  }

  void increment(CartAttr cartAttr) {
    cartAttr.increase();
    notifyListeners();
  }

  void decrement(CartAttr cartAttr) {
    cartAttr.decrease();

    notifyListeners();
  }
}
