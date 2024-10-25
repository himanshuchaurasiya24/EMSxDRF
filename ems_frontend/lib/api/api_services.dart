import 'dart:convert';
import 'package:ems_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String loginUrl = 'http://127.0.0.1:8000/user/login/';
String registerUrl = 'http://127.0.0.1:8000/user/register/';

class ApiServices {
  Future<dynamic> login(
      {required String username, required String password}) async {
    var response = await http.post(Uri.parse(loginUrl),
        body: {'username': username, 'password': password.toString()});
    dynamic data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      pref.setString('access_token', data['access']);
      pref.setString('refresh_token', data['refresh']);
      return data;
    } else if (response.statusCode == 400 || response.statusCode == 404) {
      return data;
    } else {
      return {'message': 'some error beyond status code.'};
    }
  }

  Future<dynamic> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String dateJoined,
    required String dob,
    required String address,
    required String password,
  }) async {
    var response = await http.post(Uri.parse(registerUrl), body: {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'address': address,
      'password': password,
      'date_joined': dateJoined,
      'dob': dob,
    });
    var data = jsonDecode(response.body);
    // debugPrint(data.toString());
    if (response.statusCode == 201) {
      return data;
    } else if (response.statusCode == 400) {
      debugPrint('kjbkjbkj ${data['message']}');
      return data['message'];
    }
    return data.toString();
  }
}
