// ignore_for_file: constant_identifier_names


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
  static const OWNER_GET_URL = '$API_URL/user/proprietario/';

  static const String API_LOCATION_KEY =
      "AIzaSyD0qBxYechVt9ibozWktY8tfsdEQaIkgX4";


  static String urlPlaceKeywordLocation(
      String keyword, double latitude, double longitude) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&keyword=$keyword&key=$API_LOCATION_KEY";
  }
}
