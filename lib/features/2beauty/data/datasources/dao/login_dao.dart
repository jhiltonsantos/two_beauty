import 'package:sqflite/sqflite.dart';
import 'package:two_beauty/features/2beauty/data/datasources/app_database.dart';
import 'package:two_beauty/features/2beauty/data/models/login_get_token_model.dart';

class LoginDAO {
  static const String _tableName = 'login_access';
  static const String _id = 'id';
  static const String _username = 'username';
  static const String _password = 'password';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_username TEXT, '
      '$_password TEXT)';

  Future<int> save(LoginGetTokenModel loginUser) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> loginMap = {};
    loginMap[_username] = loginUser.username;
    loginMap[_password] = loginUser.password;
    return db.insert(_tableName, loginMap);
  }

  Future<List<LoginGetTokenModel>> findUser() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<LoginGetTokenModel> users = [];
    for (Map<String, dynamic> row in result) {
      final LoginGetTokenModel login = LoginGetTokenModel(
          username: row[_username], password: row[_username]);
      users.add(login);
    }
    return users;
  }

  Future<void> delete() async {
    final Database db = await getDatabase();
    db.rawQuery('DELETE FROM $tableSql');
  }
}
