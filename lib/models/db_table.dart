abstract class DbTable {
  // late String tableName;
  DbTable();
  DbTable.fromMap(Map<String, dynamic> rowMap);

  Map<String, dynamic> toMap();
}
