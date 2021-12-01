class AppStrings {
  static const API_URL = 'https://beauty-2.herokuapp.com';
  static const USER_CREATE = '$API_URL/user/';
  static const USER_GET = '$API_URL/';
  static const LOGIN_USER = '$API_URL/api/token/';
  static const STORE_URL = '$API_URL/estabelecimento/';
  static const IMAGE_SALON =
      'https://images.unsplash.com/photo-1560066984-138dadb4c035?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80';
  static const String API_LOCATION_KEY =
      "AIzaSyD0qBxYechVt9ibozWktY8tfsdEQaIkgX4";

  static String urlForReferenceImage(String photoReferenceId) {
    if (photoReferenceId == "assets/images/logo.png") {
      return "assets/images/logo.png";
    }
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReferenceId&key=$API_LOCATION_KEY";
  }

  static String urlPlaceKeywordLocation(
      String keyword, double latitude, double longitude) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&keyword=$keyword&key=$API_LOCATION_KEY";
  }

  static const String nameAppUpper = "2BEAUTY";
  static const String subtitleMainScreen =
      "Agende seu horário de\nqualquer lugar";
  static const String signupText = "Fazer\nCadastro";
  static const String loginText = "Fazer\nLogin";
  static const String noRouteFound = "Rota não encontrada";
  static const String notImplemented = "Ainda não implementado";
  static const String nearToYou = "Perto de você";
  static const String failRequestMap = "Não foi possível realizar a pesquisa.";
  static const String listMap = "Lista de Salões";
}
