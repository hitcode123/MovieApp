import 'package:movie_app/Models/movieList_model.dart';

import '../Repository/Repository_Model.dart';
import 'package:rxdart/rxdart.dart';
import '../Models/movieList_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<Movielist>();

  Stream<Movielist> get allMovies => _moviesFetcher.stream;

  fetchAllMovies(String token) async {
    Movielist itemModel = await _repository.fetchAllMovies(token);
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();