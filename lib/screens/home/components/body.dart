import 'package:shopay_flutter_eccommerce/screens/home/components/banner_discount_home.dart';
import 'package:shopay_flutter_eccommerce/screens/home/components/categories_home.dart';
import 'package:shopay_flutter_eccommerce/screens/home/components/header_home_part.dart';
import 'package:shopay_flutter_eccommerce/screens/home/components/popular_products.dart';
import 'package:shopay_flutter_eccommerce/screens/home/components/special_offers.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({super.key,});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getPropScreenHeight(20)),
            const HeaderHomePart(),
            SizedBox(height: getPropScreenHeight(10)),
            const BannerDiscountHome(),
            const Categories(),
            const SpecialOffers(),
            SizedBox(height: getPropScreenHeight(20)),
            const PopularProducts(),
            SizedBox(height: getPropScreenHeight(20)),
          ],
        ),
      ),
    );
  }
}











