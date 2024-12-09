import 'package:shopay_flutter_eccommerce/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: const Body(),
    );
  }
}