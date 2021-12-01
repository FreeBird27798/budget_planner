import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/storage/controllers/category_db_controller.dart';
import 'package:get/get.dart';

import '../enums.dart';

class CategoryGetxController extends GetxController {
  CategoryDbController _dbController = CategoryDbController();
  RxList<Category> categories = <Category>[].obs;

  static CategoryGetxController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    read();
    super.onInit();
  }

  Future<void> read() async {
    categories.value = await _dbController.read();
  }

  Future<bool> create({required Category category}) async {
    int newId = await _dbController.create(category);
    if (newId != 0) {
      category.id = newId;
      categories.add(category);
      categories.refresh();
      return true;
    }
    return false;
  }

  void changeCheckStatus(int id) {
    categories.forEach((element) {
      element.checked = false;
      if (element.id == id) element.checked = true;
    });
    categories.refresh();
  }

  Future<bool> deleteUserCategories() async {
    bool deleted = await _dbController.deleteUserCategories(UsersGetxController.to.user.id);
    if(deleted) categories.clear();
    return deleted;
  }

  Category? getSelectedCategory() {
    int index = categories.indexWhere((element) => element.checked);
    if (index != -1) return categories[index];
    return null;
  }

  void undoCheckedCategory() {
    categories.forEach((element) {
      element.checked = false;
    });
  }

  Category getCategoryById({required int id, bool setSelected = false}) {
    int index = categories.indexWhere((element) => element.id == id);
    if (setSelected) categories[index].checked = true;
    return categories[index];
  }

  List<Category> getCategoriesByType({required CategoryType type}) {
    bool expenses = type == CategoryType.Expense;
    return categories.where((element) => element.expense == expenses).toList();
  }
}
