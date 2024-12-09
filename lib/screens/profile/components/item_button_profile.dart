import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:shopay_flutter_eccommerce/state_managements/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ItemButtonProfile extends StatelessWidget {
  const ItemButtonProfile({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.press,
  });

  final String svgIcon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => 
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(20),
            vertical: getPropScreenWidth(10),
          ),
          padding: EdgeInsets.all(getPropScreenWidth(20)),
          decoration: BoxDecoration(
              color: value.isDarkMode ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SvgPicture.asset(
                svgIcon,
                color: kPrimaryColor,
                width: 22,
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: getPropScreenWidth(14),
                    color: Colors.orangeAccent
                  ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.orangeAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}