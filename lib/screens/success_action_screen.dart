import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:budget_planner/widgets/card_with_logo.dart';
import 'package:budget_planner/widgets/sub_title_text.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuccessActionScreen extends StatefulWidget {
  const SuccessActionScreen({Key? key}) : super(key: key);

  @override
  _SuccessActionScreenState createState() => _SuccessActionScreenState();
}

class _SuccessActionScreenState extends State<SuccessActionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CardWithLogo(
              image: 'ic_like',
              height: 115,
              width: 120,
              borderRadius: 29,
            ),
          ),
          SizedBox(
            height: SizeConfig().scaleHeight(30),
          ),
          TitleText(text: AppLocalizations.of(context)!.well_done),
          SizedBox(height: SizeConfig().scaleHeight(12)),
          SubTitleText(text: AppLocalizations.of(context)!.well_done_sub)
        ],
      ),
    );
  }
}
