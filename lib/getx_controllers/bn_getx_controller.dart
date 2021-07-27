import 'package:budget_planner/models/bottom_naviation_screen.dart';
import 'package:budget_planner/screens/bottom_navigation/categories/category_screen.dart';
import 'package:budget_planner/screens/bottom_navigation/home/home_screen.dart';
import 'package:budget_planner/screens/bottom_navigation/profile_screen.dart';
import 'package:budget_planner/screens/bottom_navigation/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BnGetxController extends GetxController {
  List<BottomNavigationScreen> _screens = <BottomNavigationScreen>[];
  RxInt currentIndex = 0.obs;

  static BnGetxController get to => Get.find();

  void setupScreens() {
    // title: 'Home',
    _screens.add(BottomNavigationScreen(widget: HomeScreen()));
    // title: 'Categories',
    _screens.add(BottomNavigationScreen(widget: CategoryScreen()));
    // title: 'Profile',
    _screens.add(BottomNavigationScreen(widget: ProfileScreen()));
    // title: 'Tips',
    _screens.add(BottomNavigationScreen(widget: TipsScreen()));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    setupScreens();
    super.onInit();
  }

  void changeSelectedIndex({required int index}) {
    currentIndex.value = index > 1 ? index - 1 : index;
    currentIndex.refresh();
  }

  Widget get screen => _screens[currentIndex.value].widget;

  // String get title => _screens[currentIndex.value].title;

  int get index =>
      currentIndex > 1 ? currentIndex.value + 1 : currentIndex.value;
}
