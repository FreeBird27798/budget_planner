import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:budget_planner/widgets/default_container.dart';
import 'package:budget_planner/widgets/sub_title_text.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TipItem extends StatelessWidget {
  final String image;
  final String postedTime;
  final String title;

  TipItem({
    required this.image,
    required this.postedTime,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      blurRadius: 18,
      borderRadius: 8,
      offset: Offset(0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig().scaleHeight(15),
                horizontal: SizeConfig().scaleWidth(20),
              ),
              child: SvgPicture.asset(
                'images/$image.svg',
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig().scaleHeight(6),
          ),
          BudgetAppText(
            text: title,
            textColor: AppColors.APP_DARK_PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig().scaleHeight(6),
          ),
          BudgetAppText(
            text: postedTime,
            fontSize: 13,
            textColor: AppColors.SEARCH_HINT_COLOR,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig().scaleHeight(8),
          ),
        ],
      ),
    );
  }
}
