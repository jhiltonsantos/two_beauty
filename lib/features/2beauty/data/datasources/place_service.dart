// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/features/2beauty/data/models/place_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/place_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

class WebService {
  Future<List<PlaceEntity>> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final url =
        AppConstants.urlPlaceKeywordLocation(keyword, latitude, longitude);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final Iterable results = jsonResponse["results"];
      return results.map((e) => PlaceModel.fromJson(e)).toList();
    } else {
      throw Exception(AppStrings.failRequestMap);
    }
  }
}
