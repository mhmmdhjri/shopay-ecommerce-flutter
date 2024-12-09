

import 'package:shopay_flutter_eccommerce/model/products.dart';

class Cart {
  Cart({
    required this.product,
    required this.numOfItem,
  });
  final Product product;
  int numOfItem;
}
