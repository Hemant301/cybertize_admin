import 'dart:convert';
import 'dart:developer';

import 'package:fl_toast/fl_toast.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  var client = http.Client();

  Future<dynamic> login(context, {String email = "", String pwd = ""}) async {
    var client = http.Client();
    try {
      // print(accid);
      // print(otp);
      final response = await client.post(
          Uri.parse("http://159.89.160.55:5000/api/signin"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": email, "password": pwd}));
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        print(response.body);

        return jsonDecode(response.body) as Map;
      } else if (response.statusCode == 400) {
        Map data = jsonDecode(response.body) as Map;
        log(data.toString());
        showTextToast(text: data['message'], context: context);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Something went wrong";
      }
    } catch (e) {
      print(e);
      throw "Something went wrong";
    } finally {
      client.close();
    }
  }
}

final authApi = AuthApi();
