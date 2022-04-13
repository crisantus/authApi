import 'dart:convert';
import 'package:dio/dio.dart';

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

  Future<bool?> createUser({email,phone,username,password}) async {
    var urlBase =
        "https://api.wowcatholic.org/dating/auth/signup?system=WebAPI&key=Web45k87u23bNR64g094h5wFWa9v56Q1L";

    var dio = Dio();
    try {
      FormData formData = FormData.fromMap({
      "email": email,
      "phone": phone,
      "username": username,
      "password": password,
      "progress":  "{" +
                                  '"' +
                                  "NEXTSTEP" +
                                  '"' +
                                  ":" +
                                  " " +
                                  '"' +
                                  "PROFILE_UPDATE" +
                                  '"' +
                                  "}"
      });
      var response = await dio.post(urlBase, data: formData);
      //debugPrint("Sent well: ${response.data}");
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  // final response = await http.post(
  //   Uri.parse(urlBase),
  //   headers:<String, String> {"content-type": "application/json; charset=utf-8"},
  //   body: userToJson(data),
  // );
  // if (response.statusCode == 200) {
  //   debugPrint("EveryThing went Fine");
  //   return true;
  // } else {
  //   debugPrint("Something went wrong");
  //   return false;
  // }

  Future<bool> loginUser(LoginUser data) async {
    var urlBase =
        "https://api.wowcatholic.org/dating/auth/login?system=WebAPI&key=Web45k87u23bNR64g094h5wFWa9v56Q1L";
    final response = await http.post(
      Uri.parse(urlBase),
      headers: <String, String>{
        "content-type": "application/json; charset=utf-8"
      },
      body: loginToJson(data),
    );
    if (response.statusCode == 200) {
      debugPrint("Loggin");
      return true;
    } else {
      debugPrint("Something went wrong");
      return false;
    }
  }
}
