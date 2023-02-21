import 'dart:convert';
import 'dart:developer';

import 'package:cybertize_admin/util/userCred.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

const String mainBaseUrl = "http://159.89.160.55:5000/";

class EnquiryApi {
  Future<dynamic> getEnquiry() async {
    var client = http.Client();
    try {
      final response = await client.get(
        Uri.parse("http://159.89.160.55:5000/api/user/Enquiry/get"),
        headers: {"Authorization": "Bearer ${userCred.getToken()}"},
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> addEnquiry(
      {String? name, email, phone, department, source}) async {
    var client = http.Client();
    try {
      final body = {
        "name": name,
        "email": email,
        "phone": phone,
        "department": department,
        "source": source,
        "user_id": userCred.getUserId()
      };
      log(body.toString());
      final response = await client.post(
          Uri.parse("http://159.89.160.55:5000/api/user/Enquiry/add"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getToken()}"
          },
          body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return jsonDecode(response.body) as List;
      } else if (response.statusCode == 400) {
        print(response.body);
        Fluttertoast.showToast(msg: "error ${response.statusCode}");
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }
}
