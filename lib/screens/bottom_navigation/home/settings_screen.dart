import 'package:budget_planner/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/preferences/app_pref_controller.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:budget_planner/widgets/settings_card.dart';
import 'package:budget_planner/widgets/sigunature_text.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with Helpers {
  String _lang = AppPrefController().languageCode;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TitleText(text: AppLocalizations.of(context)!.settings),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                end: SizeConfig().scaleWidth(20),
                start: SizeConfig().scaleWidth(20),
                top: SizeConfig().scaleHeight(44)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsCard(
                  leadingIcon: Icons.info,
                  text: AppLocalizations.of(context)!.about_app,
                  onTap: () => Navigator.pushNamed(context, '/about_screen'),
                  hasTrailing: true,
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(15),
                  // height: 10,
                ),
                SettingsCard(
                  leadingIcon: Icons.language,
                  text: AppLocalizations.of(context)!.lang,
                  onTap: () => showLanguageBottomSheet(),
                  hasTrailing: true,
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(15),
                  // height: 10,
                ),
                SettingsCard(
                  leadingIcon: Icons.logout,
                  text: AppLocalizations.of(context)!.log_out,
                  onTap: () async => await logout(context),
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(25),
                  // height: 10,
                ),
                BudgetAppText(
                  text: AppLocalizations.of(context)!.account_and_data,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(15),
                  // height: 10,
                ),
                SettingsCard(
                  leadingIcon: Icons.delete_forever,
                  iconColor: AppColors.DELETE_COLOR,
                  hasBorder: true,
                  textColor: AppColors.DELETE_COLOR,
                  borderColor: AppColors.DELETE_COLOR,
                  text: AppLocalizations.of(context)!.clear_account,
                  onTap: () {
                    deleteDialog(
                        onTruePressed: () => clearAccountData(),
                        onFalsePressed: () => Navigator.pop(context),
                        context: context,
                        title: AppLocalizations.of(context)!.clear_account,
                        content: AppLocalizations.of(context)!
                            .clear_account_content);
                  },
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(15),
                  // height: 10,
                ),
                SettingsCard(
                  leadingIcon: Icons.person_remove,
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  backgroundColor: AppColors.DELETE_COLOR,
                  text: AppLocalizations.of(context)!.remove_account,
                  onTap: () {
                    deleteDialog(
                        onTruePressed: () => removeUserAccount(),
                        onFalsePressed: () => Navigator.pop(context),
                        context: context,
                        title:
                            '${AppLocalizations.of(context)!.remove_account}?',
                        content: AppLocalizations.of(context)!
                            .remove_account_content);
                  },
                ),
              ],
            ),
          ),
          SignatureText(
            text: AppLocalizations.of(context)!.app_name,
            bottomSpace: 44,
            fontWeight: FontWeight.w800,
          ),
          SignatureText(
            text: "V 1.0.0",
            bottomSpace: 20,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        isDismissible: true,
        barrierColor: AppColors.BARRIER_COLOR.withOpacity(0.1),
        clipBehavior: Clip.antiAlias,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18,
                      spreadRadius: 0,
                      offset: Offset(0, 10),
                    )
                  ]),
              child: BottomSheet(
                  onClosing: () {},
                  builder: (context) {
                    return SizedBox(
                      height: SizeConfig().scaleHeight(200),
                      child: ListView(
                        children: [
                          RadioListTile<String>(
                              title: Text("English"),
                              value: 'en',
                              groupValue: _lang,
                              onChanged: (String? value) {
                                setState(() {
                                  if (value != null)
                                    setState(() {
                                      _lang = value;
                                      changeLang(_lang);
                                      Navigator.pop(context);
                                    });
                                });
                              }),
                          RadioListTile<String>(
                              title: Text("عربي"),
                              value: 'ar',
                              groupValue: _lang,
                              onChanged: (String? value) {
                                if (value != null)
                                  setState(() {
                                    _lang = value;
                                    changeLang(_lang);
                                    Navigator.pop(context);
                                  });
                              }),
                        ],
                      ),
                    );
                  }),
            );
          });
        });
  }

  void changeLang(String newLocaleLanguage) {
    AppPrefController().setLanguage(newLocaleLanguage);
    MyApp.changeLanguage(context: context, locale: Locale(newLocaleLanguage));
  }

  Future<void> clearAccountData() async {
    bool cleared = await UsersGetxController.to.clearAccountData();
    String message = cleared
        ? AppLocalizations.of(context)!.clear_account_message
        : AppLocalizations.of(context)!.clear_account_error;
    showSnackBar(context, message: message, error: !cleared);
    Navigator.pop(context);
  }

  Future<void> removeUserAccount() async {
    bool removed = await UsersGetxController.to.removeAccount();
    String message = removed
        ? AppLocalizations.of(context)!.remove_account_message
        : AppLocalizations.of(context)!.remove_account_error;
    showSnackBar(context, message: message, error: !removed);
    Navigator.pop(context);
    if (removed) Navigator.pushReplacementNamed(context, '/login_screen');
  }

  Future<void> logout(BuildContext context) async {
    bool status = await AppPrefController().logout();
    if (status) {
      CurrencyGetxController.to.undoCheckedCurrency();
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }
}
