import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/screens/forgot_password/components/forgot_password_form.dart';
import 'package:shopay_flutter_eccommerce/screens/sign_up/sign_up_screen.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password", 
                style: headingStyle
              ),
              const Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              const ForgotPasswordForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: const Text("Sign Up", style: TextStyle(color: kPrimaryColor))
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}




