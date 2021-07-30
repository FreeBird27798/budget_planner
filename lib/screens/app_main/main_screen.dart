import 'package:budget_planner/getx_controllers/action_getx_controller.dart';
import 'package:budget_planner/getx_controllers/bn_getx_controller.dart';
import 'package:budget_planner/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/add_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _title = '';


  CategoryGetxController _categoryGetxController = Get.put(CategoryGetxController());
  ActionGetxController _actionGetxController = Get.put(ActionGetxController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: BnGetxController(),
      builder: (BnGetxController controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: controller.currentIndex.value != 3
              ? Colors.white
              : AppColors.INDICATOR_UNSELECTED_COLOR,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: controller.currentIndex.value != 3
                ? Colors.white
                : AppColors.INDICATOR_UNSELECTED_COLOR,
            centerTitle: true,
            title: Text(_title),
            actions: [
              Visibility(
                visible: controller.index == 0,
                child: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/settings_screen'),
                  icon: Icon(Icons.settings),
                ),
              ),
              Visibility(
                visible: controller.index == 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_new_category');
                    print('ADD NEW CATEGORY');
                  },
                  icon: Icon(Icons.add_circle_outlined),
                ),
              ),
            ],
          ),
          body: controller.screen,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int currentIndex) {
              if (currentIndex != 2)
                controller.changeSelectedIndex(index: currentIndex);
              setTitle(currentIndex);
            },
            currentIndex: controller.index,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.APP_PRIMARY_COLOR,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig().scaleWidth(10),
            ),
            unselectedItemColor: AppColors.UNSELECTED_TAB_COLOR,
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig().scaleWidth(10),
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined_outlined),
                label: AppLocalizations.of(context)!.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: AppLocalizations.of(context)!.categories,
              ),
              BottomNavigationBarItem(
                icon: AddActionButton(),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: AppLocalizations.of(context)!.profile,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.error_outline),
                label: AppLocalizations.of(context)!.tips,
              ),
            ],
          ),
        );
      },
    );
  }

  String setTitle(int selectedItemIndex) {
    setState(() {
      switch (selectedItemIndex) {
        case 0:
          _title = AppLocalizations.of(context)!.home;
          break;
        case 1:
          _title = AppLocalizations.of(context)!.categories;
          break;
        case 2:
          _title = '';
          break;
        case 3:
          _title = AppLocalizations.of(context)!.profile;
          break;
        case 4:
          _title = AppLocalizations.of(context)!.tips;
          break;
        default:
          _title = AppLocalizations.of(context)!.home;
      }
    });
    return _title;
  }
}
