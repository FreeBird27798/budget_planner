import 'package:budget_planner/getx_controllers/user_getx_controller.dart';
import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/storage/db_operations.dart';
import 'package:budget_planner/storage/db_provider.dart';
import 'package:sqflite/sqflite.dart';

class CategoryDbController with DbOperations<Category> {
  Database _database;

  CategoryDbController() : _database = DBProvider().database;

  @override
  Future<int> create(Category data) async {
    return await _database.insert(Category.TABLE_NAME, data.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    // TODO: implement delete
    int count = await _database.rawDelete(
        'DELETE FROM categories WHERE id = ? AND user_id = ? ',
        [id, UsersGetxController().user.id]);
    if (count != 0) {
      return true;
    }
    return false;
  }

  @override
  Future<List<Category>> read() async {
    // TODO: implement read
    var rowsMaps = await _database.query(Category.TABLE_NAME,
        where: 'user_id = ?', whereArgs: [UsersGetxController().user.id]);
    return rowsMaps.map((rowMap) => Category.fromMap(rowMap)).toList();
  }

  @override
  Future<Category?> show(int id) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Category data) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<bool> deleteUserCategories(int userId) async {
    int deleteRowsCount = await _database
        .delete('categories', where: 'user_id = ?', whereArgs: [userId]);
    return deleteRowsCount > 0;
  }
}
