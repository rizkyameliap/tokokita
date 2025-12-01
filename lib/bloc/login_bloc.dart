import 'dart:convert';
import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/login.dart';

class LoginBloc {
  static Future<Login> login({String? email, String? password}) async {
    try {
      String apiUrl = ApiUrl.login;
      var body = {"email": email, "password": password};

      print("🚀 ===== LOGIN BLOC START =====");
      print("📤 API URL: $apiUrl");
      print("📦 REQUEST BODY: $body");

      // 👇 kirim tanpa token & sebagai JSON
      var response = await Api().post(apiUrl, body, useToken: false);

      print("📥 RESPONSE STATUS: ${response.statusCode}");
      print("📄 RESPONSE BODY: ${response.body}");
      print("🔚 ===== LOGIN BLOC END =====");

      var jsonObj = json.decode(response.body);
      return Login.fromJson(jsonObj);
    } catch (e) {
      print("💥 LOGIN BLOC ERROR: $e");
      rethrow;
    }
  }
}
