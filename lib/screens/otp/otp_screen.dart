import 'package:shopay_flutter_eccommerce/screens/otp/components/body.dart';
import 'package:flutter/material.dart';


class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}