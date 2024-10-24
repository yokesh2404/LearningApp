import 'package:flutter/material.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/box_decorations.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onClick,
      this.height,
      this.width,
      this.backgroundColor,
      this.borderColor,
      this.borderRadius,
      required this.buttonText,
      this.fontColor,
      this.decoration,
      this.textStyle,
      this.icon});

  final Function() onClick;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final String buttonText;
  final Color? fontColor;
  final BoxDecoration? decoration;
  final TextStyle? textStyle;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        height: height ?? Dimensions.height_60,
        decoration: decoration ??
            BoxDecorations.boxDecorationwithoutShadow(
                backgroundColor: backgroundColor ?? AppColors.primary,
                borderColor: borderColor ?? AppColors.primary,
                borderRadius: borderRadius ?? Dimensions.size_100),
        width: width ?? Dimensions.screenWidth,
        alignment: Alignment.center,
        child: icon ??
            Text(
              buttonText,
              style: textStyle ??
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: fontColor ?? AppColors.light),
            ),
      ),
    );
  }
}
