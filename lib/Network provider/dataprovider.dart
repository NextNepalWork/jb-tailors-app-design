import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jbtailors/Network%20provider/loginmodel.dart';
import 'package:jbtailors/Network%20provider/registermodel.dart';

class APIProvider {
  String baseUrl = "https://upachar-pharmacy.nextnepal.org/api/v1/";
  Future<LoginResponse> performLogin(String email, String password) async {
    var url = Uri.parse(baseUrl + "auth/login");
    try {
      http.Response response = await http.post(url, body: {
        "email": email,
        "password": password,
      });
      // ignore: avoid_print
      print(response.body);
      return LoginResponse.fromJson(response.body);
    } on SocketException catch (_) {
      throw const SocketException("No internet connection");
    } on FormatException catch (_) {
      throw const FormatException("Invalid Data");
    }
  }

  Future<RegisterResponse> performRegister(
      String email, String name, String password, String cpassword) async {
    var url = Uri.parse(baseUrl + "auth/signup");

    try {
      http.Response response = await http.post(
        url,
        body: {
          "email": email,
          "name": name,
          "password": password,
          "password_confirmation": cpassword
        },
      );

      return RegisterResponse.fromJson(response.body);
    } on SocketException catch (_) {
      throw const SocketException("No internet connection");
    } on FormatException catch (_) {
      throw const FormatException("Invalid Data");
    }
  }
}
