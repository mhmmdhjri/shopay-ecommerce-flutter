import 'package:shopay_flutter_eccommerce/components/rounded_icon_button.dart';
import 'package:shopay_flutter_eccommerce/constant.dart';
import 'package:shopay_flutter_eccommerce/model/products.dart';
import 'package:shopay_flutter_eccommerce/size_config.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int currentIndex = 0;
  int totalSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getPropScreenWidth(20)),
      child: SizedBox(
        height: getPropScreenHeight(40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
              widget.product.colors.length,
              (index) => GestureDetector(
                onTap: () => setState(() {
                  currentIndex = index;
                }),
                child: ItemColorDot(
                  color: widget.product.colors[index],
                  isSelected: index == currentIndex,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                RoundedIconBtn(
                  showShadow: true,
                  icon: Icons.add,
                  press: () {
                    setState(() {
                      totalSelected++;
                    });
                  },
                ),
                SizedBox(
                  width: getPropScreenWidth(10),
                ),
                Text(
                  '$totalSelected',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 20),
                ),
                SizedBox(
                  width: getPropScreenWidth(10),
                ),
                RoundedIconBtn(
                showShadow: true,
                icon: Icons.remove,
                press: totalSelected > 1
                ? () {
                  setState(() {
                    totalSelected--;
                  });
                }
                : null)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemColorDot extends StatelessWidget {
  final color;
  final bool isSelected;
  const ItemColorDot({
    super.key,
    required this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: defaultDuration,
      transformAlignment: const Alignment(0, 0),
      margin: EdgeInsets.only(right: getPropScreenWidth(10)),
      padding: EdgeInsets.all(getPropScreenWidth(8)),
      height: getPropScreenWidth(isSelected ? 30 : 20),
      width: getPropScreenWidth(isSelected ? 30 : 20),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? kPrimaryColor : Colors.transparent,
            width: 1.5,
          )),
    );
  }
}
