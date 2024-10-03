import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/resources/style_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  const CustomElevatedButton(
      {super.key,
      this.prefixIcon,
      this.suffixIcon,
      this.backgroundColor,
      this.radius,
      this.textStyle,
      this.isStadiumBorder = true,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: isStadiumBorder
                ? StadiumBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
            backgroundColor: backgroundColor ?? ColorManager.primary,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14)),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            SizedBox(
              width: 24,
            ),
            Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              width: 27,
            ),
            suffixIcon ?? const SizedBox()
          ],
        ));
  }
}
