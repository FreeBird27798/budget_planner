import 'package:budget_planner/getx_controllers/category_getx_controller.dart';
import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  final List<Category> categories;
  final bool hideActionsCount;

  CategoryTab({
    required this.categories,
    this.hideActionsCount = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, itemIndex) {
          return CategoryItem(
            onTap: () {
              print('SELECT CATEGORY ${categories[itemIndex].id}');
              CategoryGetxController.to
                  .changeCheckStatus(categories[itemIndex].id);
            },
            title: categories[itemIndex].name,
            actionsCount: hideActionsCount ? null : '7',
            checked: categories[itemIndex].checked,
          );
        },
        separatorBuilder: (context, itemIndex) => Divider(
              height: SizeConfig().scaleHeight(48),
              color: AppColors.LIGHT_TEXT_COLOR,
              thickness: SizeConfig().scaleWidth(1),
            ),
        itemCount: categories.length);
  }
}
