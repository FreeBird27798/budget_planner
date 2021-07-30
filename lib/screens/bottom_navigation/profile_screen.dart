import 'package:budget_planner/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/models/user.dart';
import 'package:budget_planner/preferences/app_pref_controller.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_elevated_button.dart';
import 'package:budget_planner/widgets/card_with_logo.dart';
import 'package:budget_planner/widgets/row_field.dart';
import 'package:budget_planner/widgets/row_text_field.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _dailyLimitTextController;

  Currency? _currency;
  String _pinCode = '';
  bool _createdEnabled = false;

  @override
  void initState() {
    super.initState();

    User user = AppPrefController().user;

    _nameTextController = TextEditingController(text: user.name);
    _emailTextController = TextEditingController(text: user.email);
    _dailyLimitTextController =
        TextEditingController(text: user.dayLimit.toString());
    _currency = CurrencyGetxController.to
        .getCurrencyById(id: user.currencyId, setSelected: true);
    _pinCode = user.pin.toString();
    print('Your Info ${_pinCode + user.email + user.name}');
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _dailyLimitTextController.dispose();
    CurrencyGetxController.to.undoCheckedCurrency();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        // top: SizeConfig().scaleHeight(103),
        start: SizeConfig().scaleWidth(35),
        end: SizeConfig().scaleWidth(35),
      ),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig().scaleHeight(25),
          ),
          CardWithLogo(
            image: 'ic_profile',
            height: 115,
            width: 120,
            borderRadius: 29,
          ),
          SizedBox(
            height: SizeConfig().scaleHeight(13),
          ),
          TitleText(text: AppLocalizations.of(context)!.my_name),
          SizedBox(
            height: SizeConfig().scaleHeight(43),
          ),
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig().scaleHeight(25)),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig().scaleWidth(17),
              vertical: SizeConfig().scaleHeight(10),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.EX_IN_BOX_SHADOW_COLOR,
                    blurRadius: 18,
                    spreadRadius: 0,
                    offset: Offset(0, 10),
                  )
                ]),
            child: Column(
              children: [
                // AppLocalizations.of(context)!.none
                RowTextField(
                  textController: _nameTextController,
                  text: AppLocalizations.of(context)!.name + ':',
                  hintText: AppLocalizations.of(context)!.none,
                  onChanged: (value) => validateForm(),
                ),
                Divider(),
                RowTextField(
                  textController: _emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  text: AppLocalizations.of(context)!.email_address + ':',
                  hintText: AppLocalizations.of(context)!.none,
                  onChanged: (value) => validateForm(),
                ),
                Divider(),
                RowField(
                  title: AppLocalizations.of(context)!.currency,
                  value:
                      _currency?.nameEn ?? AppLocalizations.of(context)!.none,
                  onTap: () => navigateToCurrencyScreen(),
                  iconData: Icons.arrow_forward_ios,
                ),
                Divider(),
                RowTextField(
                  textController: _dailyLimitTextController,
                  keyboardType: TextInputType.number,
                  maxLength: 7,
                  text: AppLocalizations.of(context)!.daily_limit + ':',
                  hintText: '\$ 5000',
                  onChanged: (value) => validateForm(),
                ),
                Divider(),
                RowField(
                    title: AppLocalizations.of(context)!.change_your_pin,
                    value: _pinCode,
                    onTap: () => navigateToPinCodeScreen()),
              ],
            ),
          ),

          BudgetAppElevatedButton(
            text: AppLocalizations.of(context)!.save,
            onPressed: () async => performUpdateProfile(),
            enabled: _createdEnabled,
          ),
          // SizedBox(
          //   height: SizeConfig().scaleHeight(191),
          // ),
        ],
      ),
    );
  }

  void navigateToCurrencyScreen() async {
    var currency =
        await Navigator.pushNamed(context, '/currency_screen') as Currency?;
    if (currency != null) {
      setState(() {
        _currency = currency;
      });
      validateForm();
    }
  }

  void navigateToPinCodeScreen() async {
    var pinCode =
        await Navigator.pushNamed(context, '/pin_code_screen') as String?;
    if (pinCode != null) {
      setState(() {
        _pinCode = pinCode;
      });
      validateForm();
    }
  }

  void validateForm() {
    updateEnableStatus(checkData());
  }

  void updateEnableStatus(bool status) {
    setState(() {
      _createdEnabled = status;
    });
  }

  bool checkData() {
    return _nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _currency != null &&
        _dailyLimitTextController.text.isNotEmpty &&
        _pinCode.isNotEmpty;
  }

  void performUpdateProfile() async {
    if (_createdEnabled) {
      await updateProfile();
    } else {
      //SHOW ERROR MESSAGE
    }
  }

  Future<void> updateProfile() async {
    bool status = await UsersGetxController.to.createAccount(user: user);
    if (status) {
      CurrencyGetxController.to.undoCheckedCurrency();
      Navigator.pushReplacementNamed(context, '/success_screen');
    } else {
      //SHOW MESSAGE - ERROR
    }
  }

  User get user {
    User user = UsersGetxController.to.user;
    user.name = _nameTextController.text;
    if (_emailTextController.text != AppPrefController().user.email) {
      user.email = _emailTextController.text;
    }
    print('APP PREF EMAIL : ${AppPrefController().user.email}');
    print(
        'EMAIL_TEXT_EDITOR_CONTROLLER EMAIL : ${AppPrefController().user.email}');
    print('User EMAIL : ${AppPrefController().user.email}');
    user.pin = int.parse(_pinCode);
    user.dayLimit = double.parse(_dailyLimitTextController.text);
    user.currencyId = _currency!.id;
    return user;
  }
}
