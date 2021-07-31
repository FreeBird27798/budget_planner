import 'package:budget_planner/enums.dart';
import 'package:budget_planner/getx_controllers/action_getx_controller.dart';
import 'package:budget_planner/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner/getx_controllers/currency_getx_controller.dart';
import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/models/user_action.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_elevated_button.dart';
import 'package:budget_planner/widgets/card_with_logo.dart';
import 'package:budget_planner/widgets/default_container.dart';
import 'package:budget_planner/widgets/expense_income_card.dart';
import 'package:budget_planner/widgets/row_field.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'categories/category_screen.dart';

class AddActionScreen extends StatefulWidget {
  @override
  _AddActionScreenState createState() => _AddActionScreenState();
}

class _AddActionScreenState extends State<AddActionScreen> with Helpers {
  Currency? _currency;
  Category? _category;

  DateTime? _pickedDateValue;
  String? _pickedDate;

  bool _buttonEnabled = false;
  CategoryType? selectedType;

  late TextEditingController _actionAmountTextController;
  late TextEditingController _noteTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _actionAmountTextController = TextEditingController();
    _noteTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _actionAmountTextController.dispose();
    _noteTextController.dispose();
    CategoryGetxController.to.undoCheckedCategory();
    CurrencyGetxController.to.undoCheckedCurrency();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            // top: SizeConfig().scaleHeight(81),
            start: SizeConfig().scaleWidth(20),
            end: SizeConfig().scaleWidth(20),
          ),
          child: Container(
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                CardWithLogo(
                  image: 'ic_wallet_add',
                  height: 115,
                  width: 120,
                  borderRadius: 29,
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(13),
                ),
                TitleText(text: AppLocalizations.of(context)!.add_operation),
                SizedBox(
                  height: SizeConfig().scaleHeight(43),
                ),
                TextField(
                  controller: _actionAmountTextController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 7,
                  onChanged: (String value) => validateForm(),
                  style: TextStyle(
                    color: AppColors.TEXT_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig().scaleTextFont(21),
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '\$ 0,00',
                    hintStyle: TextStyle(
                      color: AppColors.TEXT_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig().scaleTextFont(21),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(33),
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(92),
                  // width: SizeConfig().scaleWidth(374),
                  child: Row(
                    children: [
                      ExpenseIncomeCard(
                        type: CategoryType.Expense,
                        selected: selectedType == CategoryType.Expense,
                      ),
                      SizedBox(
                        width: SizeConfig().scaleWidth(10),
                      ),
                      ExpenseIncomeCard(
                        type: CategoryType.Income,
                        selected: selectedType == CategoryType.Income,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(11),
                ),
                DefaultContainer(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: SizeConfig().scaleHeight(15),
                      end: SizeConfig().scaleHeight(15),
                    ),
                    child: Column(
                      children: [
                        RowField(
                          title: AppLocalizations.of(context)!.categories,
                          value: _category?.name ??
                              AppLocalizations.of(context)!.none,
                          onTap: () => navigateToCategoryScreen(),
                          iconData: Icons.arrow_forward_ios,
                        ),
                        Divider(),
                        RowField(
                          title: AppLocalizations.of(context)!.date,
                          value:
                              _pickedDate ?? AppLocalizations.of(context)!.none,
                          onTap: () async {
                            await pickDate();
                          },
                          iconData: Icons.arrow_forward_ios,
                        ),
                        Divider(),
                        RowField(
                          title: AppLocalizations.of(context)!.currency,
                          value: _currency?.nameEn ??
                              AppLocalizations.of(context)!.none,
                          onTap: () => navigateToCurrencyScreen(),
                          iconData: Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                  ),
                  offset: Offset(0, 3),
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(11),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: SizeConfig().scaleHeight(31)),
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig().scaleWidth(14),
                  ),
                  height: SizeConfig().scaleHeight(112),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    controller: _noteTextController,
                    maxLength: 150,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      counterText: '',
                      hintText: AppLocalizations.of(context)!.note,
                      hintStyle: TextStyle(color: AppColors.SEARCH_HINT_COLOR),
                    ),
                  ),
                ),
                BudgetAppElevatedButton(
                  text: AppLocalizations.of(context)!.add,
                  onPressed: () async => saveAction(),
                  enabled: _buttonEnabled,
                ),
                SizedBox(
                  height: SizeConfig().scaleHeight(39),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pickDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: _pickedDateValue ?? DateTime.now(),
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (dateTime != null) {
      _pickedDateValue = dateTime;
      var format = DateFormat.yMd('en');
      setState(() {
        _pickedDate = format.format(dateTime);
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

  void navigateToCategoryScreen() async {
    var category = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(withScaffold: true),
      ),
    ) as Category?;
    if (category != null) {
      setState(() {
        _category = category;
        changeCategoryType(
          _category!.expense ? CategoryType.Expense : CategoryType.Income,
        );
      });
      validateForm();
    }
  }

  void changeCategoryType(CategoryType? categoryType) {
    setState(() {
      selectedType = categoryType;
    });
    validateForm();
  }

  void validateForm() {
    updateEnableStatus(checkData());
  }

  void updateEnableStatus(bool status) {
    setState(() {
      _buttonEnabled = status;
    });
  }

  bool checkData() {
    if (_actionAmountTextController.text.isNotEmpty &&
        _category != null &&
        _pickedDate != null &&
        _currency != null) {
      return true;
    }
    return false;
  }

  Future<void> saveAction() async {
    if (_buttonEnabled) {
      bool created = await ActionGetxController.to.create(action: action);
      String message = created
          ? AppLocalizations.of(context)!.action_save_message
          : AppLocalizations.of(context)!.action_save_error;
      if (created) {
        Navigator.pushReplacementNamed(context, '/success_action_screen');
        showSnackBar(context, message: message);
        clear();
      } else {
        showSnackBar(context, message: message, error: !created);
      }
    }
  }

  UserAction get action {
    UserAction action = UserAction();
    action.amount = double.parse(_actionAmountTextController.text);
    action.expense = _category!.expense;
    action.date = _pickedDateValue!;
    action.userId = UsersGetxController.to.user.id;
    action.currencyId = _currency!.id;
    action.categoryId = _category!.id;
    action.notes = _noteTextController.text;
    return action;
  }

  void clear() {
    CategoryGetxController.to.undoCheckedCategory();
    CurrencyGetxController.to.undoCheckedCurrency();
    _actionAmountTextController.text = '';
    _noteTextController.text = '';
    setState(() {
      _pickedDateValue = null;
      _pickedDate = null;
      selectedType = null;
      _category = null;
      _currency = null;
    });
  }
}
