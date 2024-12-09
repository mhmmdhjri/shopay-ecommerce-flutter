import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.text, required this.image
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
         Text('Shopay',
            style: TextStyle(
              fontSize: getPropScreenWidth(36),
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ), ),
           Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getPropScreenWidth(14),
              color: kSecondaryColor
            ), 
            ),
            const Spacer(flex: 2,),
            Image.asset(image, 
            height: getPropScreenHeight(265), 
            width: getPropScreenWidth(235),),
      ],
    );
  }
}