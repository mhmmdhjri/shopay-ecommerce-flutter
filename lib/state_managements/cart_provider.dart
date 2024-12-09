import 'package:shopay_flutter_eccommerce/model/cart.dart';
import 'package:shopay_flutter_eccommerce/model/products.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _listCart = [
    Cart(
      product: demoProducts[1],
      numOfItem: 3,
    ),
    Cart(
      product: demoProducts[0],
      numOfItem: 3,
    ),
    Cart(
      product: demoProducts[3],
      numOfItem: 3,
    ),
    Cart(
      product: demoProducts[2],
      numOfItem: 3,
    ),
  ];
  List<Cart> get cartItems => _listCart;

  int get totalItems => _listCart.length;
// agar 2 angka dibelakang koma tidak lebih dari 2 dan di bulatkan
  double get totalPrice => double.parse(
    _listCart
      .fold(
        0.0,
      (double total, current) => total + current.product.price * current.numOfItem).toStringAsFixed(2),
  );

  void addCartItems(Cart cartItems){
    final index = 
    _listCart.indexWhere((item) => item.product.id == cartItems.product.description);

    if (index != -1) {
      _listCart[index].numOfItem += cartItems.numOfItem;
    }else{
      _listCart.add(cartItems);
    }
    notifyListeners();
  }


  void removeCartItems(Cart cartItems){
    _listCart.removeWhere((items) => items.product.id == cartItems.product.id);
    notifyListeners();
  }

  void clearCart() {
    _listCart.clear();
    notifyListeners();
  }
}