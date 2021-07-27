import 'package:budget_planner/getx_controllers/action_getx_controller.dart';
import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/action_item.dart';
import 'package:budget_planner/widgets/actions_date_text.dart';
import 'package:budget_planner/widgets/actions_list.dart';
import 'package:budget_planner/widgets/budget_app_elevated_button.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:budget_planner/widgets/circular_progress_info.dart';
import 'package:budget_planner/widgets/empty_data_widget.dart';
import 'package:budget_planner/widgets/sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isNotEmpty = false;

  @override
  Widget build(BuildContext context) {
    return GetX<ActionGetxController>(
        builder: (ActionGetxController controller) {
      String dailyLimit = (controller.totalExpenses.value /
              UsersGetxController.to.user.dayLimit)
          .toStringAsFixed(2);
      String expenses = (controller.totalExpenses.value).toStringAsFixed(2);
      String balance = (controller.totalIncomes.value).toStringAsFixed(2);
      return Container(
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig().scaleWidth(20),
          end: SizeConfig().scaleWidth(20),
        ),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: SizeConfig().scaleWidth(260),
              height: SizeConfig().scaleHeight(260),
              alignment: AlignmentDirectional.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.BOX_SHADOW_COLOR.withOpacity(0.5),
                      blurRadius: 11,
                      spreadRadius: 0,
                      offset: Offset(0, 13),
                    ),
                  ]),
              child: CircularPercentIndicator(
                radius: SizeConfig().scaleHeight(260),
                lineWidth: 11.0,
                percent: double.parse(dailyLimit),
                backgroundColor: AppColors.APP_PRIMARY_COLOR.withOpacity(0.1),
                progressColor: AppColors.CREATE_NOW_COLOR,
                circularStrokeCap: CircularStrokeCap.round,
                center: CircularProgressInfo(
                  expenses: double.parse(expenses),
                  balance: double.parse(balance),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig().scaleHeight(40),
            ),
            Align(
              child: BudgetAppText(
                textAlign: TextAlign.start,
                text: AppLocalizations.of(context)!.last_actions,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                textColor: AppColors.APP_DARK_PRIMARY_COLOR,
              ),
            ),
            SizedBox(
              height: SizeConfig().scaleHeight(20),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsetsDirectional.only(
                  top: SizeConfig().scaleHeight(19),
                  start: SizeConfig().scaleWidth(12),
                  end: SizeConfig().scaleWidth(12),
                ),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: AppColors.BOX_SHADOW_COLOR.withOpacity(0.5),
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: Offset(0, 5)),
                ]),
                height: SizeConfig().scaleHeight(487),
                child: controller.actions.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: SizeConfig().scaleHeight(24),
                                );
                              },
                              padding: EdgeInsetsDirectional.zero,
                              itemCount: controller.actions.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    index == 0
                                        ? Column(
                                            children: [
                                              ActionDateText(
                                                date: controller
                                                    .actions[index].date,
                                              ),
                                              SizedBox(
                                                height: SizeConfig()
                                                    .scaleHeight(20),
                                              ),
                                              ActionItem(
                                                action:
                                                    controller.actions[index],
                                                onTap: () {
                                                  controller.changeCheckStatus(
                                                      controller
                                                          .actions[index].id);
                                                  navigateToActionsDetailsScreen();
                                                },
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Visibility(
                                                visible: controller
                                                        .actions[index].date !=
                                                    controller
                                                        .actions[index - 1]
                                                        .date,
                                                child: ActionDateText(
                                                  date: controller
                                                      .actions[index].date,
                                                ),
                                              ),
                                              ActionItem(
                                                action:
                                                    controller.actions[index],
                                                onTap: () {
                                                  controller.changeCheckStatus(
                                                      controller
                                                          .actions[index].id);
                                                  navigateToActionsDetailsScreen();
                                                },
                                              ),
                                            ],
                                          ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: SizeConfig().scaleHeight(30)),
                          BudgetAppElevatedButton(
                            text: AppLocalizations.of(context)!.see_more,
                            onPressed: () => navigationToActionScreen(),
                            enabled: controller.actions.isNotEmpty,
                          ),
                        ],
                      )
                    : EmptyDataWidget('NO Actions Yet'),
              ),
            ),
          ],
        ),
      );
    });
  }

  navigationToActionScreen() {
    Navigator.pushNamed(context, '/actions_screen');
  }

  void navigateToActionsDetailsScreen() {
    Navigator.pushNamed(context, '/action_details_screen');
  }


}
