import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:two_beauty/features/2beauty/data/datasources/dao/login_dao.dart';

Future<sql.Database> getDatabase() async {
  final String path = join(await sql.getDatabasesPath(), '2beauty.db');
  return sql.openDatabase(
    path,
    onCreate: (sql.Database database, int version) async {
      database.execute(LoginDAO.tableSql);
    },
    version: 1,
  );
}
