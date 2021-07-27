import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/models/user_action.dart';
import 'package:budget_planner/storage/db_operations.dart';
import 'package:budget_planner/storage/db_provider.dart';
import 'package:sqflite/sqflite.dart';

class ActionDbController extends DbOperations<UserAction> {
  Database _database;

  ActionDbController() : _database = DBProvider().database;

  @override
  Future<int> create(UserAction data) {
    return _database.insert('actions', data.toMap());
  }

  @override
  Future<List<UserAction>> read() async {
    List<Map<String, dynamic>> data = await _database.query('actions',
        where: 'user_id = ?', whereArgs: [UsersGetxController.to.user.id]);
    if (data.isNotEmpty) {
      return data.map((rowMap) => UserAction.fromMap(rowMap)).toList();
    }
    return [];
  }

  @override
  Future<bool> update(UserAction data) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<UserAction?> show(int id) {
    // TODO: implement show
    throw UnimplementedError();
  }

  Future<bool> deleteUserActions(int userId) async{
    int deleteRowsCount = await _database.delete('actions',where: 'user_id = ?',whereArgs: [userId]);
    return deleteRowsCount > 0;
  }
}
