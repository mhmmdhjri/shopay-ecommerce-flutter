import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key, required this.name, required this.icon,
  });

  final String name, icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getPropScreenWidth(55),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            height: getPropScreenWidth(55),
            width: getPropScreenWidth(55),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 5),
          Text(name, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
