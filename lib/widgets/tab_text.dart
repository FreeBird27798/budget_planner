import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

class TabText extends StatelessWidget {
  final int index;
  final String text;

  TabText({
    required this.text,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: SizeConfig().scaleTextFont(13),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
