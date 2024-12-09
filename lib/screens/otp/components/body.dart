import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/screens/otp/components/otp_form.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Column(
            children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text(
                  "OTP Verification",
                  style: headingStyle,
                ),
                const Text(
                  "We sent your code to +62 123 321 ***",
                  textAlign: TextAlign.center,
                ),
                timer(),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                const OtpForm(),
              ],
          ),
        )
      ),
    );
  }


  Row timer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "This code will expired in ",
          textAlign: TextAlign.center,
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0.0),
          duration: const Duration(seconds: 60),
          builder: (context, value, child) {
            return Text(
              "00:${value.toInt()}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red),
            );
          },
          onEnd: () {},
        )
      ],
    );
  }
}

