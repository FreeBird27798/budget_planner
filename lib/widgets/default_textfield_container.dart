import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/default_container.dart';
import 'package:flutter/material.dart';

class DefaultTextFieldContainer extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final Color hintColor;
  final double fontSize;
  final double letterSpacing;
  final double startContentPadding;
  final double endContentPadding;
  final double topContentPadding;
  final double bottomContentPadding;
  final FontWeight fontWeight;
  final bool obscureText;
  final int maxLines;
  final void Function(String value)? onChanged;

  DefaultTextFieldContainer({
    required this.hintText,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.hintColor = AppColors.LIGHT_TEXT_COLOR,
    this.fontSize = 15,
    this.maxLines = 1,
    this.letterSpacing = 0.06,
    this.startContentPadding = 0,
    this.endContentPadding = 0,
    this.topContentPadding = 0,
    this.bottomContentPadding = 0,
    this.fontWeight = FontWeight.w400,
    this.obscureText = false,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
        child: TextField(
          maxLines: maxLines,
          keyboardType: keyboardType,
          controller: textEditingController,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.only(
              start: SizeConfig().scaleWidth(startContentPadding),
              end: SizeConfig().scaleWidth(endContentPadding),
              top: SizeConfig().scaleHeight(topContentPadding),
              bottom: SizeConfig().scaleHeight(bottomContentPadding),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: SizeConfig().scaleTextFont(fontSize),
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
          ),
          onChanged: onChanged,
        ));
  }
}
