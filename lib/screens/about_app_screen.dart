import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:budget_planner/widgets/card_with_logo.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration(milliseconds: 3000), () {
  //     Navigator.pushReplacementNamed(context, '/on_boarding_screen');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // SizeConfig()().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColors.APP_PRIMARY_COLOR
        ),
        automaticallyImplyLeading: true,
        title: TitleText(text: AppLocalizations.of(context)!.about),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig().scaleHeight(275),
        ),
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Column(
            children: [
              CardWithLogo(
                image: 'launch_logo',
                height: 167,
                width: 170,
                borderRadius: 45,
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(29),
              ),
              BudgetAppText(
                text: AppLocalizations.of(context)!.app_name,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
                textColor: AppColors.APP_DARK_PRIMARY_COLOR,
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(15),
              ),
              BudgetAppText(
                text: AppLocalizations.of(context)!.company_name,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
                textColor: AppColors.APP_DARK_PRIMARY_COLOR,
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(8),
              ),
              BudgetAppText(
                text: AppLocalizations.of(context)!.my_name,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
                textColor: AppColors.APP_DARK_PRIMARY_COLOR.withOpacity(0.47),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
