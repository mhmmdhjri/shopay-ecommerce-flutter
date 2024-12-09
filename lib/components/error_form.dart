import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorForm extends StatelessWidget {
  const ErrorForm({
    super.key, required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => errorText(text: errors[index])),
    );
  }

  Row errorText({required String text}) {
    return Row(
        children: [
          SvgPicture.asset(
            "assets/icons/Error.svg",
            height: getPropScreenHeight(14),
            width: getPropScreenWidth(14),
          ),
          SizedBox(width: getPropScreenWidth(10)),
          Text(text, style: const TextStyle(color: Colors.red)),
        ],
      );
  }
}





