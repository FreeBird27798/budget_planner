import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_elevated_button.dart';
import 'package:budget_planner/widgets/code_text_field.dart';
import 'package:budget_planner/widgets/pin_code_button.dart';
import 'package:budget_planner/widgets/pin_code_row.dart';
import 'package:budget_planner/widgets/sub_title_text.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PinCodeScreen extends StatefulWidget {
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  String _pinCode = '';
  bool _buttonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.APP_PRIMARY_COLOR, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: SizeConfig().scaleHeight(122),
            start: SizeConfig().scaleWidth(20),
            end: SizeConfig().scaleWidth(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleText(text: AppLocalizations.of(context)!.enter_passcode),
              SizedBox(
                height: SizeConfig().scaleHeight(6),
              ),
              SubTitleText(text: AppLocalizations.of(context)!.new_pin),
              SizedBox(
                height: SizeConfig().scaleHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CodeTextField(
                    marginEnd: 12,
                    code: _getPinFieldCode(position: 1),
                  ),
                  CodeTextField(
                    marginEnd: 12,
                    code: _getPinFieldCode(position: 2),
                  ),
                  CodeTextField(
                    marginEnd: 12,
                    code: _getPinFieldCode(position: 3),
                  ),
                  CodeTextField(
                    code: _getPinFieldCode(position: 4),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(60),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: SizeConfig().scaleWidth(48),
                  end: SizeConfig().scaleWidth(48),
                ),
                child: Column(
                  children: [
                    PinCodeRow(
                      firstNumber: '1',
                      firstNumberAction: () => setPinCode(code: '1'),
                      secondNumber: '2',
                      secondNumberAction: () => setPinCode(code: '2'),
                      thirdNumber: '3',
                      thirdNumberAction: () => setPinCode(code: '3'),
                    ),
                    SizedBox(height: SizeConfig().scaleHeight(25)),
                    PinCodeRow(
                      firstNumber: '4',
                      firstNumberAction: () => setPinCode(code: '4'),
                      secondNumber: '5',
                      secondNumberAction: () => setPinCode(code: '5'),
                      thirdNumber: '6',
                      thirdNumberAction: () => setPinCode(code: '6'),
                    ),
                    SizedBox(height: SizeConfig().scaleHeight(25)),
                    PinCodeRow(
                      firstNumber: '7',
                      firstNumberAction: () => setPinCode(code: '7'),
                      secondNumber: '8',
                      secondNumberAction: () => setPinCode(code: '8'),
                      thirdNumber: '9',
                      thirdNumberAction: () => setPinCode(code: '9'),
                    ),
                    SizedBox(height: SizeConfig().scaleHeight(25)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PinCodeButton(
                          number: '0',
                          marginEnd: SizeConfig().scaleWidth(32),
                          onPressed: () => setPinCode(code: '0'),
                        ),
                        PinCodeButton(
                          icon: Icons.backspace,
                          color: AppColors.APP_PRIMARY_COLOR,
                          onPressed: () => removeCode(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // ),
              SizedBox(
                height: SizeConfig().scaleHeight(57),
              ),
              BudgetAppElevatedButton(
                text: AppLocalizations.of(context)!.apply,
                onPressed: () => _buttonEnabled ? applyCode() : null,
                enabled: _buttonEnabled,
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(79),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _getPinFieldCode({required int position}) {
    if (_pinCode.isNotEmpty && _pinCode.length >= position) {
      return _pinCode[position - 1];
    }
  }

  void setPinCode({required String code}) {
    if (_pinCode.length < 4) {
      setState(() {
        _pinCode += code;
      });
    }
    if(_pinCode.length == 4) {
      setState(() {
        _buttonEnabled = true;
      });
    }
  }

  void removeCode() {
    if (_pinCode.isNotEmpty) {
      setState(() {
        _pinCode = _pinCode.substring(0, _pinCode.length - 1);
      });
    }
    if(_pinCode.length != 4) {
      setState(() {
        _buttonEnabled = false;
      });
    }
  }

  void applyCode() {
    if (_pinCode.length == 4) {
      Navigator.pop(context, _pinCode);
    }
  }
}
