import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:two_beauty/features/2beauty/data/datasources/app_database.dart';
import 'package:two_beauty/features/2beauty/data/models/login_get_token_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';

class LoginDAO {
  static const String _tableName = 'login_access';
  static const String _id = 'id';
  static const String _username = 'username';
  static const String _password = 'password';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_username TEXT, '
      '$_password TEXT)';

  Future<int> saveLoginData(LoginGetTokenEntity loginUser) async {
    final sql.Database db = await getDatabase();
    final Map<String, dynamic> data = {
      _username: loginUser.username,
      _password: loginUser.password
    };
    return await db.insert(_tableName, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  Future<List<LoginGetTokenModel>> getUsers() async {
    final sql.Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tableName, orderBy: 'id');
    final List<LoginGetTokenModel> users = [];
    for (Map<String, dynamic> row in result) {
      final LoginGetTokenModel loginUser = LoginGetTokenModel(
          username: row[_username], password: row[_password]);
      users.add(loginUser);
    }
    return users;
  }

  Future<LoginGetTokenModel> getUserLogin({int getId = 0}) async {
    final sql.Database db = await getDatabase();
    final List<Map<String, dynamic>> queryResult = await db.query(_tableName,
        where: 'id = ?', whereArgs: [getId], limit: 1);
    return LoginGetTokenModel(
        username: queryResult[0][_username],
        password: queryResult[0][_password]);
  }

  Future<void> deleteLogin() async {
    final sql.Database db = await getDatabase();
    try {
      await db.delete(_tableName);
    } catch (error) {
      debugPrint('Erro ao deletar login de usuário');
    }
  }
}
