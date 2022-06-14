import 'package:sqflite/sqflite.dart' as sql;
import 'package:two_beauty/features/2beauty/data/datasources/dao/login_dao.dart';

class AppDatabase {
  final LoginDAO loginDAO = LoginDAO();

  Future<sql.Database> db() async {
    return sql.openDatabase('2beauty.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await loginDAO.createTable(database);
    });
  }
}
