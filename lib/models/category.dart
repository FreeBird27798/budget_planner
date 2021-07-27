import 'package:budget_planner/models/db_table.dart';

class Category extends DbTable {
  late int id;
  late String name;
  late bool expense;
  late int userId;
  bool checked = false;

  static const TABLE_NAME = 'categories';

  Category();

  Category.fromMap(Map<String, dynamic> rowMap) : super.fromMap(rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    userId = rowMap['user_id'];
    expense = rowMap['expense'] == 1;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['name'] = name;
    map['user_id'] = userId;
    map['expense'] = expense ? 1 : 0;
    return map;
  }
}
