import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWithLogo extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final double borderRadius;

  CardWithLogo({
    required this.image,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      // width: width,
      height: SizeConfig().scaleHeight(height),
      width: SizeConfig().scaleWidth(width),
      // margin: EdgeInsetsDirectional.all(10),
      padding: EdgeInsetsDirectional.only(
        top: SizeConfig().scaleHeight(20),
        bottom: SizeConfig().scaleHeight(20),
        start: SizeConfig().scaleWidth(40),
        end: SizeConfig().scaleWidth(40),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
              color: AppColors.DISABLED_COLOR.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 18,
              offset: Offset(0, 10))
        ],
      ),
      child: SvgPicture.asset('images/$image.svg'),
    );
  }
}
