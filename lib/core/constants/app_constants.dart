// ignore_for_file: constant_identifier_names

import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';

class AppConstants {
  static const API_URL = 'https://beauty-2.herokuapp.com';
  static const USER_CREATE = '$API_URL/user/';
  static const USER_GET = '$API_URL/';
  static const PROFILE_GET = '$API_URL/user/get/';
  static const LOGIN_USER = '$API_URL/api/token/';
  static const STORE_URL = '$API_URL/estabelecimento';
  static const STORE_GET_POST = '$API_URL/estabelecimento/';
  static const SERVICE_ALL_URL = '$API_URL/servico';
  static const USER_GET_NAME = '$API_URL/user/get/';
  static const AGENDA_URL = '$API_URL/horario/';
  static const OWNER_POST_URL = '$API_URL/user/proprietario/create/';
  static const String API_LOCATION_KEY =
      "AIzaSyD0qBxYechVt9ibozWktY8tfsdEQaIkgX4";

  static String urlForReferenceImage(String photoReferenceId) {
    if (photoReferenceId == ImageAssets.logoImage) {
      return ImageAssets.logoImage;
    }
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReferenceId&key=$API_LOCATION_KEY";
  }

  static String urlPlaceKeywordLocation(
      String keyword, double latitude, double longitude) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&keyword=$keyword&key=$API_LOCATION_KEY";
  }
}
