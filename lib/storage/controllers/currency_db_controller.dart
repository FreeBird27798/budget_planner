import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/storage/db_operations.dart';
import 'package:budget_planner/storage/db_provider.dart';
import 'package:sqflite/sqflite.dart';

class CurrencyDbController with DbOperations<Currency> {
  Database _database;

  CurrencyDbController() : _database = DBProvider().database;

  @override
  Future<int> create(Currency data) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Currency>> read() async {
    // TODO: implement read
    var rowsMaps = await _database.query(Currency.TABLE_NAME);
    return rowsMaps.map((rowMap) => Currency.fromMap(rowMap)).toList();
  }

  @override
  Future<Currency?> show(int id) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Currency data) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
