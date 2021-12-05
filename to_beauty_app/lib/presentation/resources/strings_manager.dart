import 'package:to_beauty_app/presentation/resources/assets_manager.dart';

class AppConstants {
  static const API_URL = 'https://beauty-2.herokuapp.com';
  static const USER_CREATE = '$API_URL/user/';
  static const USER_GET = '$API_URL/';
  static const LOGIN_USER = '$API_URL/api/token/';
  static const STORE_URL = '$API_URL/estabelecimento';
  static const STORE_ALL_URL = '$API_URL/estabelecimento/';
  static const SERVICE_ALL_URL = '$API_URL/servico';
  static const USER_GET_NAME = '$API_URL/user/get/';
  static const AGENDA_CREATE = '$API_URL/horario/';

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

class AppStrings {
  static const String nameAppUpper = "2BEAUTY";
  static const String subtitleMainScreen =
      "Agende seu horário de\nqualquer lugar";
  static const String signupText = "Fazer\nCadastro";
  static const String loginText = "Fazer\nLogin";
  static const String signupPageRegister = "Cadastre-se";
  static const String chooseOptionSignUp =
      "Faça seu cadastro com as seguintes opções:";
  static const String chooseOptionLogin =
      "Faça seu login com as seguintes opções:";
  static const String createAccount = "Criar conta";
  static const String entryAccount = "Log In";
  static const String haveAnAccountSingUp = "Já possui uma conta?";
  static const String dontHaveAccount = "Não possui uma conta?";
  static const String doLoginPage = "Faça login";
  static const String doCreatePage = "Inscrever-se";

  static const String noRouteFound = "Rota não encontrada";
  static const String notImplemented = "Ainda não implementado";
  static const String nearToYou = "Perto de você";
  static const String failRequestMap = "Não foi possível realizar a pesquisa.";
  static const String failCreateDataUser =
      "Não foi possível realizar o cadastro. Verifique seus dados.";
  static const String failLoginDataUser = "Usuário ou senha incorretos";
  static const String listMap = "Lista de Salões";
  static const String appBarCreateStore = "Cadastre seu negócio";
  static const String appBarAgenda = "Agendamento";
  static const String titleService = "Qual serviço\nvocê deseja?";
}
