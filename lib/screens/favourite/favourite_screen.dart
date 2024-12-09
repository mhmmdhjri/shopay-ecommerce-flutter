import 'package:shopay_flutter_eccommerce/screens/favourite/components/body.dart';
import 'package:shopay_flutter_eccommerce/state_managements/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/favourite";
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Your Favorites",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Consumer<FavouriteProvider>(
              builder: (context, fav, child) => Text(
                  "${fav.favoriteProducts.length} items",
                  style: Theme.of(context).textTheme.bodySmall),
            ),
          ],
        ),
      ),
      body: const Body(),
    );
  }
}