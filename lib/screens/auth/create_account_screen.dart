import 'package:budget_planner/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/models/user.dart';
import 'package:budget_planner/preferences/app_pref_controller.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_elevated_button.dart';
import 'package:budget_planner/widgets/card_with_logo.dart';
import 'package:budget_planner/widgets/default_container.dart';
import 'package:budget_planner/widgets/row_field.dart';
import 'package:budget_planner/widgets/row_text_field.dart';
import 'package:budget_planner/widgets/sub_title_text.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _dailyLimitTextController;

  Currency? _currency;
  String _pinCode = '';
  bool _createdEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _dailyLimitTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _dailyLimitTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.APP_PRIMARY_COLOR, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: SizeConfig().scaleHeight(81),
            start: SizeConfig().scaleWidth(20),
            end: SizeConfig().scaleWidth(20),
          ),
          child: Column(
            children: [
              CardWithLogo(
                image: 'ic_wallet',
                height: 115,
                width: 120,
                borderRadius: 29,
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(13),
              ),
              TitleText(text: AppLocalizations.of(context)!.get_started),
              SizedBox(
                height: SizeConfig().scaleHeight(11),
              ),
              SubTitleText(
                  text: AppLocalizations.of(context)!.get_started_text),
              SizedBox(
                height: SizeConfig().scaleHeight(20),
              ),
              DefaultContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig().scaleWidth(20),
                      vertical: SizeConfig().scaleHeight(20)),
                  child: Column(
                    children: [
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
                        value: _currency?.nameEn ??
                            AppLocalizations.of(context)!.none,
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
                          title: AppLocalizations.of(context)!.set_your_pin,
                          value: _pinCode,
                          onTap: () => navigateToPinCodeScreen()),
                    ],
                  ),
                ),
                offset: Offset(0, 3),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(102),
              ),
              BudgetAppElevatedButton(
                text: AppLocalizations.of(context)!.create_account,
                onPressed: () async => performCreateAccount(),
                enabled: _createdEnabled,
              ),
            ],
          ),
        ),
      ),
    );
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

  void performCreateAccount() async {
    if (_createdEnabled) {
      await createAccount();
    } else {
      showSnackBar(context,
          message: 'Failed to Create Account, PLease check the Requirements',
          error: true);
    }
  }

  Future<void> createAccount() async {
    bool status = await UsersGetxController.to.createAccount(user: user);
    if (status) {
      CurrencyGetxController.to.undoCheckedCurrency();
      Navigator.pushReplacementNamed(context, '/success_screen');
      AppPrefController().setIsFirstTime(false);
      showSnackBar(context,
          message: AppLocalizations.of(context)!.create_account_message);
    } else {
      showSnackBar(context,
          message: AppLocalizations.of(context)!.create_account_error,
          error: true);
    }
  }

  User get user {
    User user = User();
    user.name = _nameTextController.text;
    user.email = _emailTextController.text;
    user.pin = int.parse(_pinCode);
    user.dayLimit = double.parse(_dailyLimitTextController.text);
    user.currencyId = _currency!.id;
    return user;
  }
}
