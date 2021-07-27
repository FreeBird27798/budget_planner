import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin Helpers {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<bool> deleteDialog({
    required BuildContext context,
    required String title,
    required String content,
    required void Function() onTruePressed,
    required void Function() onFalsePressed,
  }) async {
    bool status = await showDialog(
        barrierColor: AppColors.BARRIER_COLOR.withOpacity(0.1),
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(
                    SizeConfig().scaleHeight(25)),
                side: BorderSide(color: AppColors.DELETE_COLOR, width: 1)),
            title: BudgetAppText(
              text: title,
              fontSize: 15,
              textColor: AppColors.DELETE_COLOR,
              fontWeight: FontWeight.w500,
            ),
            content: BudgetAppText(
              text: content,
              fontSize: 12,
              textColor: AppColors.APP_DARK_PRIMARY_COLOR,
            ),
            actions: [
              TextButton(
                onPressed: onFalsePressed,
                child: BudgetAppText(
                  text: AppLocalizations.of(context)!.no,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: onTruePressed,
                child: BudgetAppText(
                  text: AppLocalizations.of(context)!.yes,
                  fontSize: 12,
                  textColor: AppColors.DELETE_COLOR,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          );
        });
    return status;
  }


}
