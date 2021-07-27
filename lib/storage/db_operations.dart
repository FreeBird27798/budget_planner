import 'package:budget_planner/models/db_table.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbOperations<T> {
  late Database _database;

  Future<int> create(T data);

  Future<List<T>> read();

  Future<T?> show(int id);

  Future<bool> update(T data);

  Future<bool> delete(int id);
}
