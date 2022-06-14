import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:two_beauty/features/2beauty/data/datasources/dao/login_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'two_beauty.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(LoginDAO.tableSql);
  }, version: 1);
}