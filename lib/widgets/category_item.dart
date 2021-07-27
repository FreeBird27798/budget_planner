import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String? actionsCount;
  final void Function()? onTap;
  final bool? checked;

  CategoryItem({
    required this.title,
    this.checked,
    this.actionsCount,
    this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.category_outlined,
            color: AppColors.APP_PRIMARY_COLOR,
          ),
          SizedBox(width: SizeConfig().scaleWidth(13)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BudgetAppText(
                text: title,
                textColor: AppColors.TEXT_COLOR,
                fontWeight: FontWeight.w500,
              ),
              Visibility(
                visible: actionsCount != null,
                child: BudgetAppText(
                  text: '$actionsCount ' +
                      (actionsCount == '1' ? 'Action' : 'Actions'),
                  textColor: AppColors.APP_PRIMARY_COLOR,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            checked! ? Icons.check : null,
            color: AppColors.APP_PRIMARY_COLOR,
          ),
        ],
      ),
    );
  }
}
