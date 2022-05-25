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

class AppStrings {
  static const String noRouteFound = "Rota não encontrada";
  static const String notImplemented = "Ainda não implementado";
  static const String nearToYou = "Perto de você";
  static const String failRequestMap = "Não foi possível realizar a pesquisa.";
  static const String timeException = "Tempo Excedido na Execução";

  static const String listMap = "Lista de Salões";

  static const String appBarAgenda = "Agendamento";
  static const String titleService = "Qual serviço\nvocê deseja?";
}

class InitialStrings {
  static const String nameAppUpper = "2Beauty";
  static const String subtitleMainScreen =
      "Agende seu horário de qualquer lugar";
  static const String signupText = "Criar conta";
  static const String loginText = "Fazer login";
}

class SignUpStrings {
  static const String titleSignUp = "Criar conta";
  static const String userNameTextField = "Usuário";
  static const String userNameInputField = "Ex: hiltonsantos";
  static const String emailTextField = "Email";
  static const String emailInputField = "Ex: hilton@gmail.com";
  static const String passwordTextField = "Senha";
  static const String passwordInputField = "Crie uma senha forte aqui";
  static const String buttonTextSignUp = "Criar conta";
  static const String haveAnAccountSingUp = "Já possui uma conta?";
  static const String doLoginPage = "Faça login";
  static const String failCreateDataUser =
      "Não foi possível realizar o cadastro. Verifique seus dados.";
}

class LoginStrings {
  static const String titleLogin = "Fazer login";
  static const String userTextField = "Usuário";
  static const String passwordTextField = "Senha";
  static const String buttonTextLogin = "Fazer login";
  static const String dontHaveAccount = "Ainda não possui uma conta?";
  static const String doCreatePage = "Crie uma conta";
  static const String failLoginDataUser = "Usuário ou senha incorretos";
}

class HomeStrings {
  static const String mapButton = "Perto de você";
  static const String perfilSideMenu = "Perfil";
  static const String createStoreSideMenu = "Criar negócio";
  static const String logOffStoreSideMenu = "Sair";
}

class CreateStoreStrings {
  static const String appBarCreateStore = "Cadastre seu negócio";
  static const String initForm = "Começar";
  static const String nameStoreField = "Nome do estabelecimento";
  static const String cnpjStoreField = "CNPJ do estabelecimento";
  static const String addressForm = "Endereço";
  static const String streetStoreField = "Rua";
  static const String districtStoreField = "Bairro";
  static const String cityStoreField = "Cidade";
  static const String numberStoreField = "Número";
  static const String cepStoreField = "CEP";
  static const String openStoreField = "Abre";
  static const String closeStoreField = "Fecha";
  static const String phoneStoreField = "Telefone";
  static const String currentLocationButton = "Pegar localização";
  static const String saveButton = "Criar";
}
