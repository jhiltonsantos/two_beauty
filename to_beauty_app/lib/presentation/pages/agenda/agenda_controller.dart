import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class AgendaContorller {
  final Uri apiUri = Uri.parse(AppConstants.API_URL);
  final Uri estabelecimentoCreate = Uri.parse(AppConstants.STORE_URL);
}
