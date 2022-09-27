import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:quiz_u/app/data/model/LoginResponse.dart';
import 'package:quiz_u/app/data/request/login_request.dart';

import '../model/TokenResponse.dart';
import 'api_constants.dart';

class ApiService {

  Future<LoginResponse?> loginUser(LoginRequest loginRequest) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);
      print(url);
      print(loginRequest.toJson());
      var response = await http.post(url, body: loginRequest.toJson());
      print("statusCode: ${response.statusCode}");
      print("body: ${response.body}");
      if (response.statusCode >= 200 && response.statusCode < 400) {
        LoginResponse _model = loginResponseFromJson(response.body);
        return _model;
      } else { // Error 401
        LoginResponse _model = loginResponseFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<TokenResponse?> validateRemoteToken(var token) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.tokenEndpoint);
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print("statusCode: ${response.statusCode}");
      print("body: ${response.body}");
      if (response.statusCode >= 200 && response.statusCode < 400) {
        TokenResponse _model = tokenResponseFromJson(response.body);
        return _model;
      } else { // Error 401
        TokenResponse _model = tokenResponseFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}