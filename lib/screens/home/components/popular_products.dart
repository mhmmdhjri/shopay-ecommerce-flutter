import 'package:shopay_flutter_eccommerce/components/item_popular_product.dart';
import 'package:shopay_flutter_eccommerce/model/products.dart';
import 'package:shopay_flutter_eccommerce/screens/details/detail_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/home/components/section_title.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: const SectionTitle(title: "Popular Products"),
        ),
        SizedBox(height: getPropScreenHeight(20)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
          child: GridView.builder(
            shrinkWrap: true, // Membatasi GridView agar menyesuaikan konten
            physics: const NeverScrollableScrollPhysics(), // Tidak scroll sendiri
            itemCount: demoProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Jumlah kolom
              crossAxisSpacing: getPropScreenWidth(10), // Jarak antar kolom
              mainAxisSpacing: getPropScreenHeight(20), // Jarak antar baris
              childAspectRatio: 0.75, // Rasio aspek untuk setiap item
            ),
            itemBuilder: (context, index) {
              final Product product = demoProducts[index];
              return ItemPopularProduct(
                product: product,
                press: () => Navigator.pushNamed(
                  context,
                  DetailScreen.routeName,
                  arguments: product,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
