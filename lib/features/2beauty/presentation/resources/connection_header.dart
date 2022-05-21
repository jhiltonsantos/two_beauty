// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConnectionHeaderApi {
  Future<http.Response> getResponse(Uri url) async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    return await http.get(url, headers: header);
  }

  Future<http.Response> postResponse(Uri url, Map data) async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    return await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
  }
}
