import 'package:sqflite/sqflite.dart';

mixin Queries {
  late Database dbInstance;

  Future<void> createCurrenciesTable() async {
    await dbInstance.execute('CREATE TABLE currencies ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name_en TEXT,'
        'name_ar TEXT'
        ')');
  }

  Future<void> insertCurrencies() async {
    await dbInstance.rawInsert(
        'INSERT INTO currencies (name_en, name_ar) VALUES (?, ?)',
        ['NIS (₪)', 'شيكل (₪)']);

    await dbInstance.rawInsert(
        'INSERT INTO currencies (name_en, name_ar) VALUES (?, ?)',
        ['USD (\$)', 'دولار أمريكي (\$)']);

    await dbInstance.rawInsert(
        'INSERT INTO currencies (name_en, name_ar) VALUES (?, ?)',
        ['JOD (JD)', 'دينار (JD)']);
  }

  Future<void> createUsersTable() async {
    await dbInstance.execute('CREATE TABLE users ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name TEXT,'
        'email TEXT UNIQUE,'
        'currency_id TINYINT,'
        'day_limit NUMERIC,'
        'pin INTEGER'
        ')');
  }

  Future<void> createCategoriesTable() async {
    await dbInstance.execute('CREATE TABLE categories ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name TEXT,'
        'user_id INTEGER,'
        'expense BOOLEAN'
        ')');
  }

  // Future<void> insertExpenseCategories() async {
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Shopping', true]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Travel', true]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Food', true]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Medicine', true]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Cash', true]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Sport', true]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Education', true]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Accommodation', true]);
  // }
  // Future<void> insertIncomeCategories() async {
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Shopping', false]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Travel',false ]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Food', false]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Medicine', false]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Cash', false]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Sport', false]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Education', false]);
  //   await dbInstance.rawInsert(
  //       'INSERT INTO categories (name, expense) VALUES (?, ?)', ['Accommodation', false]);
  // }

  Future<void> createActionsTable() async {
    await dbInstance.execute('CREATE TABLE actions ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'amount INTEGER,'
        'date DATE,'
        'expense BOOLEAN,'
        'notes TEXT NULL,'
        'user_id INTEGER,'
        'category_id INTEGER,'
        'currency_id INTEGER'
        ')');
  }
}
