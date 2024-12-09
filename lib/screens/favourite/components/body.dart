import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/model/cart.dart';
import 'package:shopay_flutter_eccommerce/model/products.dart';
import 'package:shopay_flutter_eccommerce/screens/details/detail_screen.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:shopay_flutter_eccommerce/state_managements/cart_provider.dart';
import 'package:shopay_flutter_eccommerce/state_managements/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, favourites, child) {
        if (favourites.favoriteProducts.isEmpty) {
          return const Center(
            child: Text('No favourite products'),
          );
        }
        return ListView.builder(
          itemCount: favourites.favoriteProducts.length,
          itemBuilder: (context, index) {
            final Product favourite = favourites.favoriteProducts[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context,DetailScreen.routeName , arguments: favourite);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getPropScreenWidth(20),
                  vertical: getPropScreenWidth(10),
                ),
                child: Slidable(
                  key: Key(favourite.id.toString()),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          Provider.of<CartProvider>(context, listen: false)
                              .addCartItems(Cart(product: favourite, numOfItem: 1));
                          favourites.toggleFavouriteStatus(favourite.id);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Added to cart'),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        icon: Icons.shopping_cart,
                        label: 'Cart',
                        padding: EdgeInsets.all(getPropScreenWidth(20)),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          favourites.toggleFavouriteStatus(favourite.id);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Removed from favourite'),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
                        icon: Icons.delete,
                        label: 'Delete',
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: getPropScreenWidth(88),
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Container(
                            padding: EdgeInsets.all(getPropScreenWidth(20)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kSecondaryColor.withOpacity(0.2),
                            ),
                            child: Image.asset(
                              favourite.images[0],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            favourite.title,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "\$${favourite.price}",
                              style: TextStyle(
                                fontSize: getPropScreenWidth(14),
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                            ),
                          ])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}