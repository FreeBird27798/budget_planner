import 'package:budget_planner/models/user.dart';
import 'package:budget_planner/preferences/app_pref_controller.dart';
import 'package:budget_planner/storage/controllers/user_db_controller.dart';
import 'package:get/get.dart';

import 'action_getx_controller.dart';
import 'category_getx_controller.dart';

class UsersGetxController extends GetxController {
  UserDbController _userDbController = UserDbController();
  late User user;

  static UsersGetxController get to => Get.find();

  @override
  void onInit() {
    if (AppPrefController().loggedIn) user = AppPrefController().user;
    super.onInit();
  }

  Future<bool> createAccount({required User user}) async {
    var newUserId = await _userDbController.createAccount(user: user);
    if (newUserId != 0) {
      user.id = newUserId;
      await AppPrefController().saveUser(user: user);
      return true;
    }
    return false;
  }

  Future<bool> updateUser({required User user}) async {
    var count = await _userDbController.updateUser(user: user);
    if (count != 0) {
      await AppPrefController().saveUser(user: user);
      print('USER UPDATED SUCCESSFULLY');
      return true;
    }
      print('CAN NOT  UPDATE USER');
    return false;
  }

  Future<bool> login({required String email, required String pin}) async {
    User? user = await _userDbController.login(email: email, pin: pin);
    if (user != null) {
      await AppPrefController().saveUser(user: user);
      this.user = user;
      refresh();
      update();
      return true;
    }
    return false;
  }

  Future<bool> removeUserAccount() async {
    return await _userDbController.delete(
        userId: UsersGetxController.to.user.id);
  }

  Future<bool> clearAccountData() async {
    return await ActionGetxController.to.deleteUserActions() &&
        await CategoryGetxController.to.deleteUserCategories();
  }

  Future<bool> removeAccount() async {
    return await ActionGetxController.to.deleteUserActions() &&
        await CategoryGetxController.to.deleteUserCategories() &&
        await UsersGetxController.to.removeUserAccount() &&
        await AppPrefController().logout();
  }
}
