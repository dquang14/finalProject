import 'package:flutter/material.dart';
import 'obj/product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addProduct(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }
  void deleteProduct(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + item.price);
}
