/* Saving All Constant Values */

import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Colors.deepOrangeAccent;
const kPrimaryLightColor = Color.fromARGB(255, 255, 158, 21);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.blue, // A lighter and brighter blue
      Color.fromARGB(255, 191, 234, 244), // A slightly darker blue for contrast
    ]);

const kSecondaryColor = Color(0xff979797);
const kTextColor = Color(0xff757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getPropScreenWidth(28),
  fontWeight: FontWeight.bold,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";

// Complete Profile
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter address";

// OTP style

final otpDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getPropScreenHeight(15),
  ),
  enabledBorder: otpOutlineInputBorder(),
  focusedBorder: otpOutlineInputBorder(),
  border: otpOutlineInputBorder(),
);
const Color inactiveColor = Color.fromARGB(255, 143, 146, 145);

OutlineInputBorder otpOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kTextColor),
  );
}

const defaultDuration = Duration(milliseconds: 250);

TextStyle seeMoreStyle =
    TextStyle(fontSize: getPropScreenWidth(11), fontWeight: FontWeight.bold);
