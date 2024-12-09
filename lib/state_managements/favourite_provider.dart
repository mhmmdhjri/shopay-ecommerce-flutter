import 'package:shopay_flutter_eccommerce/model/products.dart';
import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  final List <Product> _listProducts = demoProducts;
  // get favorite products = true from list products

  List<Product> get products => _listProducts;

  // FavoriteProvider() {
  //   print(favoriteProducts.asMap());
  // }

  List<Product> get favoriteProducts {
    return _listProducts.where((product) => product.isFavourite).toList();
  }

  void toggleFavouriteStatus(int id){
    final productIndex = _listProducts.indexWhere((product) => product.id == id);
    _listProducts[productIndex].isFavourite = !_listProducts[productIndex].isFavourite;
    notifyListeners();
  }


}