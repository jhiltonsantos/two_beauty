import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:two_beauty/domain/entities/place_model.dart';
import 'package:two_beauty/presentation/resources/strings_manager.dart';


class WebService {
  Future<List<PlaceModel>> fetchPlacesByKeywordAndPosition(
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
