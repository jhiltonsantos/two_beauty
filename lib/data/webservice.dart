import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/domain/place_model.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

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
