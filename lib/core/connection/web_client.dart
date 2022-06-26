// ignore_for_file: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:two_beauty/core/interceptors/data_intercpetor.dart';

final http.Client client = InterceptedClient.build(
    interceptors: [DataInterceptor()],
    requestTimeout: const Duration(seconds: 20));
