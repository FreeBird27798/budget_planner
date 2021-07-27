import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

class AddActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig().scaleHeight(45),
      width: SizeConfig().scaleWidth(45),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.APP_PRIMARY_COLOR,
      ),
      child: IconButton(
        onPressed: () => Navigator.pushNamed(context, '/add_action_screen'),
        padding: EdgeInsets.zero,
        icon: Icon(Icons.add),
        iconSize: SizeConfig().scaleWidth(30),
        color: Colors.white,
      ),
    );
  }
}
