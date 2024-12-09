import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';
class MyDefaultButton extends StatelessWidget {
  const MyDefaultButton({
    super.key, required this.text, required this.press,
  });

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        minimumSize: Size(double.infinity, getPropScreenHeight(56)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
      child: Text(
        text, 
        style: TextStyle(
          color: Colors.white,
          fontSize: getPropScreenWidth(18),
        )
      ),
    );
  }
}
