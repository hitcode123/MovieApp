import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Exception/exception.dart';

class PostRequest {
  Future<void> postRequest(Map<String, dynamic> body) async {
    final response = await http.post(
        Uri.parse('https://api-telly-tell.herokuapp.com/api/client/signup'),
        body: body);
    var x = json.decode(response.body);

    if (x['status'] == 'failed') {
      
      throw CustomException(x['message']);
    }
    return x['status'];
  }
}

PostRequest post = PostRequest();
