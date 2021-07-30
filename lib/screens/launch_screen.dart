import 'package:budget_planner/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/preferences/app_pref_controller.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:budget_planner/widgets/card_with_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(CurrencyGetxController());
    Get.put(UsersGetxController());
    Future.delayed(Duration(seconds: 3)).then((value) {
      String route = AppPrefController().isFirstTime
          ? '/on_boarding_screen'
          : AppPrefController().loggedIn
              ? '/main_screen'
              : '/login_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().designWidth(4.14).designHeight(8.96).init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CardWithLogo(
              image: 'launch_logo',
              height: 170,
              width: 170,
              borderRadius: 45,
            ),
            SizedBox(
              height: SizeConfig().scaleHeight(26),
            ),
            BudgetAppText(
              text: AppLocalizations.of(context)!.app_name,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
              textColor: AppColors.APP_DARK_PRIMARY_COLOR,
            )
          ],
        ),
      )
    );
  }
}
