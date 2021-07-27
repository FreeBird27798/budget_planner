import 'package:budget_planner/getx_controllers/action_getx_controller.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/action_item.dart';
import 'package:budget_planner/widgets/actions_date_text.dart';
import 'package:budget_planner/widgets/empty_data_widget.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class ActionsScreen extends StatefulWidget {
  @override
  _ActionsScreenState createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.APP_PRIMARY_COLOR),
        automaticallyImplyLeading: true,
        title: TitleText(text: AppLocalizations.of(context)!.actions),
      ),
      body: GetX<ActionGetxController>(
          builder: (ActionGetxController controller) {
        return Padding(
          padding: EdgeInsetsDirectional.only(
            top: SizeConfig().scaleHeight(113),
            bottom: SizeConfig().scaleHeight(65),
            start: SizeConfig().scaleWidth(20),
            end: SizeConfig().scaleWidth(20),
          ),
          child: Column(
            children: [
              // EdgeInsetsDirectional.only(
              //   top: SizeConfig().scaleHeight(19),
              //   start: SizeConfig().scaleWidth(12),
              //   end: SizeConfig().scaleWidth(12),
              // ),
              Container(
                height: SizeConfig().scaleHeight(44),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.INDICATOR_UNSELECTED_COLOR),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: SizeConfig().scaleHeight(16),
                      color: Colors.black,
                    ),
                    hintText: AppLocalizations.of(context)!.search,
                    hintStyle: TextStyle(
                      color: AppColors.SEARCH_HINT_COLOR,
                      fontSize: SizeConfig().scaleTextFont(15),
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(27),
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
                  child: controller.actions.isNotEmpty
                      ? ListView.separated(
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
                                            date:
                                                controller.actions[index].date,
                                          ),
                                          SizedBox(
                                            height:
                                                SizeConfig().scaleHeight(20),
                                          ),
                                          ActionItem(
                                            action: controller.actions[index],
                                            onTap: () {
                                              // controller.changeCheckStatus(
                                              //     controller.actions[index].id);
                                              // navigateToActionsDetailsScreen();
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
                                                    .actions[index - 1].date,
                                            child: ActionDateText(
                                              date: controller
                                                  .actions[index].date,
                                            ),
                                          ),
                                          ActionItem(
                                            action: controller.actions[index],
                                            onTap: () {
                                              // controller.changeCheckStatus(
                                              //     controller.actions[index].id);
                                              // navigateToActionsDetailsScreen();
                                            },
                                          ),
                                        ],
                                      ),
                              ],
                            );
                          },
                        )
                      : EmptyDataWidget('NO Actions Yet'),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  // void navigateToActionsDetailsScreen() {
  //   Navigator.pushNamed(context, '/action_details_screen');
  // }
}
