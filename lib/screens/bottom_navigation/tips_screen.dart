import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/tip_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({Key? key}) : super(key: key);

  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.INDICATOR_UNSELECTED_COLOR,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          // top: SizeConfig().scaleHeight(113),
          start: SizeConfig().scaleWidth(20),
          end: SizeConfig().scaleWidth(20),
        ),
        child: Column(
          children: [
            Container(
              height: SizeConfig().scaleHeight(44),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
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
              child: GridView.builder(
                  // shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: SizeConfig().scaleWidth(10),
                    mainAxisSpacing: SizeConfig().scaleHeight(17),
                    childAspectRatio:
                        // 182 / 230
                        SizeConfig().scaleWidth(182) /
                            SizeConfig().scaleHeight(230),
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return TipItem(
                        image: 'on_boarding_01',
                        postedTime:
                            '3 ${AppLocalizations.of(context)!.month_ago}',
                        title: AppLocalizations.of(context)!.tip);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
