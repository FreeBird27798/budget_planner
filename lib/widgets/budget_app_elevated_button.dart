import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'app_elevated_button.dart';

class BudgetAppElevatedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool enabled;

  BudgetAppElevatedButton({
    required this.text,
    this.onPressed,
    this.enabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig().scaleHeight(60),
      width: double.infinity,
      child: AppElevatedButton(
        text: text,
        onPressed: enabled ? onPressed : null,
      ),
    );
  }
}
