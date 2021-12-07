import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HeaderAuth {
  static dynamic header(Uri url) async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    print("Token API Detalhes Estabelecimento: $token");

    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(url, headers: header);

    return response;
  }
}