import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:budget_planner/widgets/sub_title_text.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingContent extends StatelessWidget {
  final String image;
  final String message;
  final String title;

  OnBoardingContent({
    required this.image,
    required this.message,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleText(text: title),
          SizedBox(
            height: SizeConfig().scaleHeight(11),
          ),
          SubTitleText(text: message),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig().scaleHeight(70),
                horizontal: SizeConfig().scaleWidth(70),
              ),
              child: SvgPicture.asset(
                'images/$image.svg',
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig().scaleHeight(62),
          ),
        ],
      ),
    );
  }
}
