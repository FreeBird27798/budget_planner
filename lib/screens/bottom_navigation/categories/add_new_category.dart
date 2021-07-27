import 'package:budget_planner/enums.dart';
import 'package:budget_planner/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_elevated_button.dart';
import 'package:budget_planner/widgets/card_with_logo.dart';
import 'package:budget_planner/widgets/default_container.dart';
import 'package:budget_planner/widgets/expense_income_card.dart';
import 'package:budget_planner/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({Key? key}) : super(key: key);

  @override
  _AddNewCategoryState createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> with Helpers {
  // bool _expensesSelected = false;
  // bool _incomeSelected = false;
  // int _incomeIndex = -1;
  // int _expenseIndex = -1;
  // bool? _selectedCategoryType;

  bool _buttonEnabled = false;
  CategoryType? selectedType;

  late TextEditingController _catNameEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _catNameEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _catNameEditingController.dispose();
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
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: AppColors.LIGHT_TEXT_COLOR,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig().scaleHeight(81),
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
              TitleText(text: AppLocalizations.of(context)!.add_category),
              SizedBox(
                height: SizeConfig().scaleHeight(50),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(92),
                // width: SizeConfig().scaleWidth(374),
                child: Row(
                  children: [
                    ExpenseIncomeCard(
                      onPressed: () => changeCategoryType(
                          categoryType: CategoryType.Expense),
                      type: CategoryType.Expense,
                      selected: selectedType == CategoryType.Expense,
                    ),
                    SizedBox(
                      width: SizeConfig().scaleWidth(10),
                    ),
                    ExpenseIncomeCard(
                      onPressed: () =>
                          changeCategoryType(categoryType: CategoryType.Income),
                      type: CategoryType.Income,
                      selected: selectedType == CategoryType.Income,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(11),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(67),
                child: DefaultContainer(
                  offset: Offset(0, 3),
                  borderRadius: 14,
                  blurRadius: 8,
                  child: TextField(
                    onChanged: (value) => validateForm(),
                    keyboardType: TextInputType.text,
                    controller: _catNameEditingController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.only(
                          start: SizeConfig().scaleWidth(20)),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText:
                          AppLocalizations.of(context)!.enter_category_name,
                      hintStyle: TextStyle(
                        color: AppColors.LIGHT_TEXT_COLOR,
                        fontSize: SizeConfig().scaleTextFont(15),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.06,
                      ),

                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5),
                      //   borderSide: BorderSide(
                      //     color: AppColors.BOX_SHADOW_COLOR,
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(30),
              ),
              BudgetAppElevatedButton(
                text: AppLocalizations.of(context)!.add,
                onPressed: () async => await performAddNewCategory(),
                enabled: _buttonEnabled,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkData() {
    return _catNameEditingController.text.isNotEmpty && selectedType != null;
  }

  void validateForm() {
    updateEnableStatus(checkData());
  }

  void updateEnableStatus(bool status) {
    setState(() {
      _buttonEnabled = status;
    });
  }

  Future<void> performAddNewCategory() async {
    if (checkData()) {
      await addNewCategory();
    }
  }

  void changeCategoryType({required CategoryType? categoryType}) {
    setState(() {
      selectedType = categoryType;
    });
    validateForm();
  }

  Future<void> addNewCategory() async {
    Category category = Category();
    category.name = _catNameEditingController.text;
    category.expense = selectedType == CategoryType.Expense;
    category.userId = UsersGetxController.to.user.id;
    bool status = await CategoryGetxController.to.create(category: category);
    String message = status
        ? AppLocalizations.of(context)!.create_category_message
        : AppLocalizations.of(context)!.create_category_error;
    if (status) {
      Navigator.pop(context);
      showSnackBar(context, message: message);
    } else {
      showSnackBar(context, message: message, error: !status);
    }
  }
}
