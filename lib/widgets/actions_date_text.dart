import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActionDateText extends StatelessWidget {
  final DateTime date;

  ActionDateText({required this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMd('en').format(date),
      style: TextStyle(
        color: AppColors.DATE_COLOR,
        fontSize: SizeConfig().scaleTextFont(12),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
