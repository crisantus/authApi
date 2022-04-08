import 'dart:convert';

import 'package:auth_app/models/loginUser.dart';
import 'package:auth_app/models/signUpUser.dart';
import 'package:auth_app/models/userData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:auth_app/models/userExist.dart';

class ApiServices {
  Future<UserExist?> checkUser({email}) async {
    var url =
        'https://api.wowcatholic.org/dating/user-exist?system=WebAPI&key=Web45k87u23bNR64g094h5wFWa9v56Q1L&email=$email';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        return UserExist.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load album');
      }
    } catch (error) {
      debugPrint("$error");
    }
  }

  Future<UserData?> userData({email}) async {
    var url =
        'https://api.wowcatholic.org/dating/user-is?system=WebAPI&key=Web45k87u23bNR64g094h5wFWa9v56Q1L&user_by=Email&identifier=${email}';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        return UserData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load');
      }
    } catch (error) {
      debugPrint("$error");
    }
  }

  Future<bool> createUser(SignUpUser data) async {
    var urlBase =
        "https://api.wowcatholic.org/dating/auth/signup?system=WebAPI&key=Web45k87u23bNR64g094h5wFWa9v56Q1L";
    final response = await http.post(
      Uri.parse(urlBase),
      headers: {"content-type": "application/json; charset=utf-8"},
      body: userToJson(data),
    );
    if (response.statusCode == 200) {
      print("EveryThing went Fine");
      return true;
    } else {
      print("Something went wrong");
      return false;
    }
  }

  Future<bool> loginUser(LoginUser data) async {
    var urlBase =
        "https://api.wowcatholic.org/dating/auth/login?system=WebAPI&key=Web45k87u23bNR64g094h5wFWa9v56Q1L";
    final response = await http.post(
      Uri.parse(urlBase),
      headers: {"content-type": "application/json; charset=utf-8"},
      body: loginToJson(data),
    );
    if (response.statusCode == 200) {
      print("Loggin");
      return true;
    } else {
      print("Something went wrong");
      return false;
    }
  }
}
