import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/models/user.dart';
import 'package:budget_planner/storage/db_provider.dart';
import 'package:sqflite/sqflite.dart';

class UserDbController {
  Database _database;

  UserDbController() : _database = DBProvider().database;

  Future<int> createAccount({required User user}) async {
    return await _database.insert(User.TABLE_NAME, user.toMap());
  }

  Future<int> updateUser({required User user}) async {
    return await _database.update(User.TABLE_NAME, user.toMap(),
        where: 'id = ?', whereArgs: [user.id]);
  }

  Future<User?> login({required String email, required String pin}) async {
    var data = await _database.query(User.TABLE_NAME,
        where: 'email = ? AND pin = ?', whereArgs: [email, pin]);
    return data.isNotEmpty ? User.fromMap(data.first) : null;
  }

  Future<bool> delete({required int userId}) async {
    int deletedRowsCount =
        await _database.delete('users', where: 'id = ?', whereArgs: [userId]);
    return deletedRowsCount > 0;
  }
}
