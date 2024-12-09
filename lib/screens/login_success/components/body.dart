import 'package:shopay_flutter_eccommerce/components/my_default_button.dart';
import 'package:shopay_flutter_eccommerce/components/custom_navigation_bar.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset("assets/images/success.png"),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Text(
            "Login Success!",
            style: TextStyle(
              fontSize: getPropScreenWidth(30),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: MyDefaultButton(
              text: "Back to Home",
              press: () {
                Navigator.pushNamed(context, CustomNavigationBar.routeName);
              },
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}