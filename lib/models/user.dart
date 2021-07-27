import 'package:budget_planner/models/db_table.dart';

class User extends DbTable {
  late int id;
  late String name;
  late String email;
  late int currencyId;
  late double dayLimit;
  late int pin;
  static const TABLE_NAME = 'users';

  User();

  User.fromMap(Map<String, dynamic> rowMap) : super.fromMap(rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    email = rowMap['email'];
    currencyId = rowMap['currency_id'];
    dayLimit = rowMap['day_limit'].toDouble();
    pin = rowMap['pin'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['name'] = name;
    map['email'] = email;
    map['currency_id'] = currencyId;
    map['day_limit'] = dayLimit;
    map['pin'] = pin;
    return map;
  }
}
