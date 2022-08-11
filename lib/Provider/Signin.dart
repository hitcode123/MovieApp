import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Exception/exception.dart';



class PostRequest {
  Future<String> postRequest(Map<String, dynamic> body) async {
    final response = await http.post(
        Uri.parse('https://api-telly-tell.herokuapp.com/api/client/signin'),
        body: body);
    if (response.statusCode == 201) {
      var x = json.decode(response.body);
      return x['token'];
    } else {

      throw CustomException("Failed to Sign in");
      
    }
  }
}

PostRequest postsignin = PostRequest();
