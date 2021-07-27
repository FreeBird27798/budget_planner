import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final Widget child;
  final double blurRadius;
  final double spreadRadius;
  final double borderRadius;
  final Offset offset;
  final Color backgroundColor;
  final double topMargin;
  final double bottomMargin;
  final double startMargin;
  final double endMargin;

  DefaultContainer({
    required this.child,
    this.blurRadius = 6,
    this.spreadRadius = 0,
    this.borderRadius = 9,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.startMargin = 0,
    this.endMargin = 0,
    this.backgroundColor = Colors.white,
    this.offset = const Offset(0, 0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: SizeConfig().scaleHeight(topMargin),
        bottom: SizeConfig().scaleHeight(bottomMargin),
        start: SizeConfig().scaleWidth(startMargin),
        end: SizeConfig().scaleWidth(endMargin),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.BOX_SHADOW_COLOR.withOpacity(0.3),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: offset,
          ),
        ],
      ),
      child: child,
    );
  }
}
