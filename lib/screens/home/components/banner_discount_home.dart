import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';

class BannerDiscountHome extends StatelessWidget {
  const BannerDiscountHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(getPropScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getPropScreenWidth(20), 
        vertical: getPropScreenHeight(15)
      ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/Banner Discount.png'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
