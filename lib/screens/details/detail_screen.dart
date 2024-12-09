import 'package:shopay_flutter_eccommerce/model/products.dart';
import 'package:shopay_flutter_eccommerce/screens/details/components/body.dart';
import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
          Navigator.pop(context);
          }, 
          // ignore: prefer_const_constructors
          icon: Icon(Icons.arrow_back_ios_new_rounded,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("${product.rating}",
                style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5,),
                const Icon(Icons.star, size: 20, color: Colors.yellowAccent,)
              ],
            ),
          )
        ],
      ),
      body: Body(product: product,),
    );
  }
}