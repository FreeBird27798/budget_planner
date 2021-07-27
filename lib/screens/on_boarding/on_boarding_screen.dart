import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_elevated_button.dart';
import 'package:budget_planner/widgets/on_boarding_content.dart';
import 'package:budget_planner/widgets/on_boarding_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;
  double _progressValue = 1 / 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig().scaleWidth(20),
          end: SizeConfig().scaleWidth(20),
          top: SizeConfig().scaleHeight(62),
          bottom: SizeConfig().scaleHeight(44),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig().scaleWidth(107)),
              width: SizeConfig().scaleWidth(199),
              height: SizeConfig().scaleHeight(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: _progressValue,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.APP_PRIMARY_COLOR),
                  backgroundColor: AppColors.INDICATOR_UNSELECTED_COLOR,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig().scaleHeight(45),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int selectedPage) {
                  setState(() {
                    _currentPage = selectedPage;
                    _progressValue = (selectedPage + 1) / 3;
                  });
                },
                children: [
                  OnBoardingContent(
                    image: 'on_boarding_01',
                    title: AppLocalizations.of(context)!.title_01,
                    message: AppLocalizations.of(context)!.message_01,
                  ),
                  OnBoardingContent(
                    image: 'on_boarding_02',
                    title: AppLocalizations.of(context)!.title_02,
                    message: AppLocalizations.of(context)!.message_02,
                  ),
                  OnBoardingContent(
                    image: 'on_boarding_03',
                    title: AppLocalizations.of(context)!.title_03,
                    message: AppLocalizations.of(context)!.message_03,
                  ),
                ],
              ),
            ),
            BudgetAppElevatedButton(
              enabled: true,
              onPressed: () {
                setState(() {
                  if (_currentPage != 2) {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                  } else {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                    //       AppPrefController().setIsFirstTime(false);
                  }
                });
              },
              text: _currentPage != 2
                  ? AppLocalizations.of(context)!.next
                  : AppLocalizations.of(context)!.lets_start,
            ),
            SizedBox(
              height: SizeConfig().scaleHeight(17),
            ),
            Visibility(
              visible: _currentPage != 2,
              child: OnBoardingTextButton(
                text: AppLocalizations.of(context)!.skip,
                fontSize: 15,
                onPressed: () => _pageController.jumpToPage(2),
              ),
              replacement: OnBoardingTextButton(
                fontSize: 15,
                text: '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
