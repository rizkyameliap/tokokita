import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tokokita/helpers/user_info.dart';
import 'app_exception.dart';

class Api {
  // POST REQUEST
  Future<dynamic> post(String url, dynamic data, {bool useToken = true}) async {
    var token = useToken ? await UserInfo().getToken() : null;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          if (useToken && token != null)
            HttpHeaders.authorizationHeader: "Bearer $token"
        },
        body: jsonEncode(data),
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // GET REQUEST
  Future<dynamic> get(String url) async {
    var token = await UserInfo().getToken();

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          if (token != null)
            HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // PUT REQUEST
  Future<dynamic> put(String url, dynamic data) async {
    var token = await UserInfo().getToken();

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          if (token != null)
            HttpHeaders.authorizationHeader: "Bearer $token",
        },
        body: jsonEncode(data),
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
  }

  // DELETE REQUEST
  Future<dynamic> delete(String url) async {
    var token = await UserInfo().getToken();

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          if (token != null)
            HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
  }

  // ERROR HANDLER
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 422:
        throw InvalidInputException(response.body.toString());
      default:
        throw FetchDataException(
            "Server error. StatusCode: ${response.statusCode}");
    }
  }
}
