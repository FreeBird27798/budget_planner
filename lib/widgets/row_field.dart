import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:flutter/material.dart';

class RowField extends StatelessWidget {
  final String title;
  final String? value;
  final IconData? iconData;
  final void Function()? onTap;

  RowField({
    required this.title,
    this.value,
    this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: SizeConfig().scaleHeight(23)),
        child: Row(
          children: [
            BudgetAppText(
              text: title,
            ),
            Spacer(),
            BudgetAppText(
              text: value ?? '',
              textColor: AppColors.LIGHT_TEXT_COLOR,
            ),
            iconData != null
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: SizeConfig().scaleHeight(13),
                    color: AppColors.BACK_ICON_COLOR,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
