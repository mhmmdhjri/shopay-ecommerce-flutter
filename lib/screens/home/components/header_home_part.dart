import 'package:shopay_flutter_eccommerce/screens/cart/cart_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/home/components/icon_with_trigger.dart';
import 'package:shopay_flutter_eccommerce/screens/home/components/search_field.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:shopay_flutter_eccommerce/state_managements/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeaderHomePart extends StatelessWidget {
  const HeaderHomePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          const IconWithTrigger(
            svgIcon: "assets/icons/Bell.svg",
            trigger: "2",
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
            child: Consumer<CartProvider>(
              builder: (context, cart, child) => 
              IconWithTrigger(
                svgIcon: "assets/icons/Cart Icon.svg",
                trigger: cart.totalItems.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

