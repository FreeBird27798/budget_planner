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

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Card(
      //           elevation: 8,
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(25),
      //           ),
      //           child: SvgPicture.asset(
      //             'images/launch_logo.svg',
      //             alignment: AlignmentDirectional.center,
      //           )),
      //     ),
      //     SizedBox(
      //       height: SizeConfig().scaleHeight(15),
      //     ),
      //     Text(
      //       'Budget Planner',
      //       textAlign: TextAlign.center,
      //     )
      //   ],
      // ),
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
          TitleText(text: AppLocalizations.of(context)!.congratulations),
          SizedBox(height: SizeConfig().scaleHeight(12)),
          SubTitleText(text: AppLocalizations.of(context)!.congratulations_text)
        ],
      ),
    );
  }
}
