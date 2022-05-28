// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_home_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

@Injectable(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Uri urlController = Uri.parse(AppConstants.AGENDA_URL);

  @override
  Future<Either<Failure, String>> getUserData() async {
    final Uri getName = Uri.parse(AppConstants.USER_GET_NAME);
    ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();
    http.Response response = await connectionHeaderApi.getResponse(getName);

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      String data = mapResponse["username"];
      return Right(data);
    } else {
      //throw Exception('Falha ao carregar usuarios');
      print("STATUS CODE GET: ${response.statusCode}");
      return Left(ServerFailure());
    }
  }
}
