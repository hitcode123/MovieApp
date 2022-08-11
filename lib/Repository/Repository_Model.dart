import 'dart:async';
import '../Models/movieList_model.dart';
import '../Provider/MovieList_provider.dart';

class Repository {
  final moviesApiProvider = fetchdetails();

  Future<Movielist> fetchAllMovies(String token) =>
      moviesApiProvider.getMovie(token);
}
