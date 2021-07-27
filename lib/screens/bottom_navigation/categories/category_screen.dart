import 'package:budget_planner/enums.dart';
import 'package:budget_planner/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/screens/bottom_navigation/categories/category_tab.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/currency_widget.dart';
import 'package:budget_planner/widgets/default_container.dart';
import 'package:budget_planner/widgets/empty_data_widget.dart';
import 'package:budget_planner/widgets/tab_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class CategoryScreen extends StatefulWidget {
  final bool withScaffold;

  CategoryScreen({this.withScaffold = false});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_selectedTabIndex != _tabController.index) {
        setState(() {
          _selectedTabIndex = _tabController.index;
        });
        print('Index: ${_tabController.index}');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.withScaffold
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(AppLocalizations.of(context)!.categories),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => popFromCategory(),
              ),
              actions: [
                IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/add_new_category'),
                  icon: Icon(Icons.add_circle_outlined),
                ),
              ],
            ),
            body: screenContent(),
          )
        : screenContent();
  }

  Widget screenContent() {
    return Container(
        padding: EdgeInsetsDirectional.only(
          // top: SizeConfig().scaleHeight(118),
          bottom: SizeConfig().scaleHeight(15),
          start: SizeConfig().scaleWidth(20),
          end: SizeConfig().scaleWidth(20),
        ),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: AppColors.INDICATOR_UNSELECTED_COLOR,
              ),
              height: SizeConfig().scaleHeight(38),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: AppColors.APP_PRIMARY_COLOR,
                ),
                unselectedLabelColor: AppColors.TEXT_COLOR,
                unselectedLabelStyle: TextStyle(
                    // color: AppColors.TEXT_COLOR,
                    ),
                controller: _tabController,
                tabs: [
                  TabText(
                    text: AppLocalizations.of(context)!.expenses,
                    index: _tabController.index,
                  ),
                  TabText(
                    text: AppLocalizations.of(context)!.incomes,
                    index: _tabController.index,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig().scaleHeight(21),
            ),
            GetX<CategoryGetxController>(
              builder: (CategoryGetxController controller) {
                List<Category> expenses =
                    controller.getCategoriesByType(type: CategoryType.Expense);
                List<Category> incomes =
                    controller.getCategoriesByType(type: CategoryType.Income);
                return Expanded(
                  child: DefaultContainer(
                    topMargin: 20,
                    endMargin: 20,
                    startMargin: 15,
                    borderRadius: 8,
                    blurRadius: 18,
                    offset: Offset(0, 10),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        expenses.isNotEmpty
                            ? CategoryTab(
                                categories: expenses,
                                hideActionsCount: true,
                              )
                            : EmptyDataWidget('NO Expenses Categories'),
                        incomes.isNotEmpty
                            ? CategoryTab(
                                hideActionsCount: true,
                                categories: incomes,
                              )
                            : EmptyDataWidget('NO Incomes Categories'),
                        // FavoritesTabScreen(),
                        // CartTabScreen(),
                        // SettingsTabScreen(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }

  void popFromCategory() {
    Navigator.pop(context, CategoryGetxController.to.getSelectedCategory());
  }
}
