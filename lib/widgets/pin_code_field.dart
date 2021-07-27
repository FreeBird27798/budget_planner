import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

class PinCodeField extends StatelessWidget {
  final String? code;
  final double marginEnd;

  PinCodeField({
    this.code,
    this.marginEnd = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: SizeConfig().scaleWidth(45),
      height: SizeConfig().scaleHeight(45),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: code == null ? Colors.white : AppColors.APP_PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.black.withOpacity(0.21),
            blurRadius: 6,
          )
        ],
      ),
      child: Text(
        code ?? '',
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig().scaleTextFont(23),
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
