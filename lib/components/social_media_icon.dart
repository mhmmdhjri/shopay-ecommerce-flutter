import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    super.key, required this.icon, required this.press,
  });

  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getPropScreenWidth(15)),
        padding: EdgeInsets.all(getPropScreenWidth(12)),
        height: getPropScreenHeight(45),
        width: getPropScreenWidth(45),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}