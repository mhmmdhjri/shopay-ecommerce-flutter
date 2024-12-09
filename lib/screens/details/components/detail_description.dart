import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/model/products.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:shopay_flutter_eccommerce/state_managements/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';


class DetailDescription extends StatelessWidget {
  const DetailDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Text(
            product.title,
            style: TextStyle(
              fontSize: getPropScreenWidth(20),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getPropScreenWidth(10)),
            width: getPropScreenWidth(64),
            decoration: BoxDecoration(
              color: product.isFavourite
                  ? kPrimaryColor.withOpacity(0.1)
                  : kSecondaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Consumer<FavouriteProvider>(
              builder: (context, favorite, child) => IconButton(
                icon: Icon(
                  Icons.favorite,
                  size: getPropScreenWidth(18),
                ),
                onPressed: () {
                  favorite.toggleFavouriteStatus(product.id);
                },
                color: product.isFavourite
                    ? Colors.red
                    : kSecondaryColor.withOpacity(0.5),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getPropScreenWidth(20),
            right: getPropScreenWidth(64),
          ),
          child: ReadMoreText(product.description,
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: kPrimaryColor,
              trimCollapsedText: "\nSee More Detail >",
              trimExpandedText: "\nSee Less Detail >",
              moreStyle: seeMoreStyle,
              lessStyle: seeMoreStyle),
        )
      ],
    );
  }
}