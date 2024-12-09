import 'package:shopay_flutter_eccommerce/model/cart.dart';
import 'package:shopay_flutter_eccommerce/screens/cart/components/item_cart.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:shopay_flutter_eccommerce/state_managements/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Body extends StatefulWidget {
  const Body({super.key});
  

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartData, child) =>
      ListView.builder(
        itemCount: cartData.cartItems.length,
        itemBuilder: (context, index) {
          final Cart cart = cartData.cartItems[index];
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getPropScreenWidth(20),
                vertical: getPropScreenWidth(10)),
            child: Dismissible(
                direction: DismissDirection.endToStart,
                key: Key(cart.product.id.toString()),
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: getPropScreenWidth(20)),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  cartData.removeCartItems(cart);
                },
                // key: Key(cart.product.id.toString()),
                child: ItemCart(cart: cart)),
          );
        },
      ),
    );
  }
}
