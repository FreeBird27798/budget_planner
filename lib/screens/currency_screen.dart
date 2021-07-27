import 'package:budget_planner/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/currency_widget.dart';
import 'package:budget_planner/widgets/default_container.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => popFromCurrency(),
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.APP_PRIMARY_COLOR,
            )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: TitleText(text: AppLocalizations.of(context)!.currency),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              end: SizeConfig().scaleWidth(20),
              start: SizeConfig().scaleWidth(20),
              top: SizeConfig().scaleHeight(31)),
          child: GetX<CurrencyGetxController>(
              builder: (CurrencyGetxController controller) {
            return DefaultContainer(
                startMargin: 15,
                endMargin: 15,
                topMargin: 24,
                bottomMargin: 24,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.currencies.length,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    thickness: 0.3,
                    height: 50,
                    color: AppColors.LIGHT_TEXT_COLOR,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => controller.changeCheckStatus(index),
                      child: CurrencyItem(
                        name: controller.currencies[index].nameEn,
                        isSelected: controller.currencies[index].checked,
                      ),
                    );
                  },
                ));
          }),
        ),
      ),
    );
  }

  void popFromCurrency() {
    Navigator.pop(context, CurrencyGetxController.to.getSelectedCurrency());
  }
}
