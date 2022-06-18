import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:two_beauty/features/2beauty/data/datasources/login_local_datasource.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/objectbox.g.dart';

@Injectable(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  late Store store;

  @override
  Future<bool> isLoginDataOnDB(LoginGetTokenEntity loginGetTokenEntity) async {
    if (await isAlreadyHaveData()) {
      return true;
    }
    queryAddLogin(loginGetTokenEntity);
    return isDataAfterQueryOk();
  }

  @override
  Future<Either<bool, LoginGetTokenEntity>> getLoginDataFromDB() async {
    if (!await isAlreadyHaveData()) {
      return const Left(false);
    }
    List<LoginGetTokenEntity> data = await getDataFromLoginTable();
    return Right(data.first);
  }

  @override
  Future<bool> removeLoginDataFromDB() async {
    await removeDataFromLoginTable();
    if (await isDataAfterQueryOk()) {
      return false;
    }
    return true;
  }

  Future<void> removeDataFromLoginTable() async {
    await initializedDBData();
    final userTable = store.box<LoginGetTokenEntity>();
    userTable.removeAll();
    closeDBData();
  }

  Future<void> initializedDBData() async {
    Directory directory = await getApplicationDocumentsDirectory();
    store = Store(
      getObjectBoxModel(),
      directory: '${directory.path}/objectbox',
    );
  }

  void closeDBData() {
    store.close();
  }

  Future<bool> isAlreadyHaveData() async {
    List<LoginGetTokenEntity> dataOK = await getDataFromLoginTable();
    if (dataOK.isEmpty) {
      return false;
    }
    return true;
  }

  Future<bool> isDataAfterQueryOk() async {
    if ((await getDataFromLoginTable()).isEmpty) {
      return false;
    }
    return true;
  }

  Future<void> queryAddLogin(LoginGetTokenEntity loginData) async {
    await initializedDBData();
    store.box<LoginGetTokenEntity>().put(loginData);
    closeDBData();
  }

  Future<List<LoginGetTokenEntity>> getDataFromLoginTable() async {
    await initializedDBData();
    final userBox = store.box<LoginGetTokenEntity>();
    final List<LoginGetTokenEntity> usersData = userBox.getAll();
    closeDBData();
    return usersData;
  }
}
