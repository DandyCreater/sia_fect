// import 'dart:async';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:sia_fect/data/dummy.dart';
// import 'package:sia_fect/data/local/auth_services.dart';
// import 'package:sia_fect/screens/login_page/login_page.dart';

// class ApiServices {
//   ApiServices();

//   final AuthServices _authServices = AuthServices();

//   final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

//   Map<String, dynamic> getUserDummy(UserType type, String regNo) {
//     if (type == UserType.dosente) {
//       return Dummy.lecturers
//           .firstWhere((element) => element['registration_number'] == regNo);
//     } else {
//       return Dummy.students
//           .firstWhere((element) => element['registration_number'] == regNo);
//     }
//   }

//   Future<bool> login({
//     required String registrationNumber,
//     required String password,
//     required UserType type,
//   }) async {
//     var body = {
//       'registration_number': registrationNumber,
//       'password': password,
//     };

//     final http.Response response = await http.get(Uri.parse(baseUrl));

//     try {
//       if (response.statusCode == 200) {
//         final userData = getUserDummy(type, registrationNumber);
//         _authServices.saveToken(DateTime.now().toString());
//         _authServices.saveUserData(jsonEncode(userData));
//       }
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   bool logout({
//     required String registrationNumber,
//     required String password,
//     required UserType type,
//   }) {
//     _authServices.logOut();
//     Timer(const Duration(seconds: 1), () => true);
//     return true;
//   }
// }

// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sia_fect/core/model/login_response_model.dart';

class ApiServices {
  final storage = const FlutterSecureStorage();
  final String baseUrl =
      "https://766e-45-115-73-54.ap.ngrok.io/sia_fect_api/los/v1";
  Dio dio = Dio();

  Future login({required String username, required String password}) async {
    try {
      var params = {
        'username': username,
        'password': password,
      };

      final result = await dio.post(baseUrl + "/userlogin.php",
          data: params,
          options: Options(
              headers: {'Content-Type': 'application/x-www-form-urlencoded'}));

      var response = result.data;

      if (result.statusCode == 200) {
        storage.write(
            key: "loginKey",
            value: jsonEncode(response),
            aOptions: AndroidOptions.defaultOptions);
        return response;
      }
    } on DioError catch (e) {
      debugPrint(e.message);
      if (e.message == "Http status error [404]") {
        return "Connection Time Out";
      }
      if (e.type == DioErrorType.other) {
        return "Database Service Error";
      } else {
        return e;
      }
    }
  }

  Future loadDataFromNRE({required String nre, required String nudep}) async {
    try {
      final response = await dio.get(
        baseUrl + '/jsondata/' + nudep + '/' + nre + "_all.json",
      );

      var result = response.data;
      return result;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return e;
    }
  }
}
