import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:flutter/material.dart';

class CodeTextField extends StatelessWidget {
  // final TextEditingController textController;
  // final FocusNode focusNode;
  // final void Function(String value) onChanged;
  // final bool filledText;
  final String? code;
  final double marginEnd;

  CodeTextField({
    // required this.textController,
    // required this.focusNode,
    // required this.onChanged,
    // required this.filledText,
    this.code,
    this.marginEnd = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: SizeConfig().scaleWidth(marginEnd)),
      width: SizeConfig().scaleWidth(45),
      height: SizeConfig().scaleHeight(45),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: code == null ? Colors.white : AppColors.APP_PRIMARY_COLOR,
          boxShadow: [
            BoxShadow(
              color: AppColors.BOX_SHADOW_COLOR.withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ]),
      child: BudgetAppText(text: code ?? '',
        textColor: Colors.white,
        fontSize: SizeConfig().scaleTextFont(23),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
