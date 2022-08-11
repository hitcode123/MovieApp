import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/Models/movieList_model.dart';

class fetchdetails {
  Future<Movielist> getMovie(String Token) async {
    final response = await http.get(
        Uri.parse('https://api-telly-tell.herokuapp.com/movies/rahul.verma'),
        headers: {'Authorization': 'Bearer ${Token}'});

    if (response.statusCode == 200) {
      var x = json.decode(response.body);
    
      return Movielist.fromJson(x);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
