import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/preferences/app_pref_controller.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_field.dart';
import 'package:budget_planner/widgets/budget_app_elevated_button.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:budget_planner/widgets/card_with_logo.dart';
import 'package:budget_planner/widgets/sub_title_text.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  bool _buttonEnabled = false;

  UsersGetxController _usersController = Get.put(UsersGetxController());
  late TextEditingController _emailTextEditingController;
  late TextEditingController _pinCodeTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailTextEditingController = TextEditingController();
    _pinCodeTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextEditingController.dispose();
    _pinCodeTextEditingController.dispose();

    // _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().designWidth(4.14).designHeight(8.96).init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsetsDirectional.only(
            top: SizeConfig().scaleHeight(81),
            start: SizeConfig().scaleWidth(20),
            end: SizeConfig().scaleWidth(20),
          ),
          alignment: AlignmentDirectional.center,
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
              TitleText(
                  text: AppLocalizations.of(context)!.login.toUpperCase()),
              SizedBox(
                height: SizeConfig().scaleHeight(11),
              ),
              SubTitleText(
                text: AppLocalizations.of(context)!.login_text,
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(50),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.21),
                    )
                  ],
                ),
                child: AppTextField(
                  enablePadding: true,
                  hintText: AppLocalizations.of(context)!.email_address,
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: _emailTextEditingController,
                  onChanged: (value) => validateForm(),
                ),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(15),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.21),
                    )
                  ],
                ),
                child: AppTextField(
                  enablePadding: true,
                  hintText: AppLocalizations.of(context)!.pin_code,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textEditingController: _pinCodeTextEditingController,
                  onChanged: (value) => validateForm(),
                ),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(30),
              ),
              BudgetAppElevatedButton(
                text: AppLocalizations.of(context)!.login,
                onPressed: () async => await performLogin(),
                enabled: _buttonEnabled,
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BudgetAppText(
                    text: AppLocalizations.of(context)!.do_not_have_account,
                    textColor: AppColors.LIGHT_TEXT_COLOR,
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/create_account_screen'),
                    child: BudgetAppText(
                      text: AppLocalizations.of(context)!.create_now,
                      textColor: AppColors.CREATE_NOW_COLOR,
                    ),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkData() {
    return _emailTextEditingController.text.isNotEmpty &&
        _pinCodeTextEditingController.text.isNotEmpty;
  }

  void validateForm() {
    updateEnableStatus(checkData());
  }

  void updateEnableStatus(bool status) {
    setState(() {
      _buttonEnabled = status;
    });
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  Future<void> login() async {
    bool status = await _usersController.login(
        email: _emailTextEditingController.text,
        pin: _pinCodeTextEditingController.text);
    if (status) {
      AppPrefController().setIsLoggedIn(status);
      AppPrefController().setIsFirstTime(!status);
      Navigator.pushReplacementNamed(context, '/main_screen');
      showSnackBar(context,
          message: AppLocalizations.of(context)!.successful_login);
    } else {
      showSnackBar(context,
          message: AppLocalizations.of(context)!.credentials_error,
          error: true);
    }
  }
}
