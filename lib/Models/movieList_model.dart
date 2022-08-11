class Movielist {
  List<MovieItem>? _Items = [];
  Movielist.fromJson(Map<String, dynamic> data) {
    List<MovieItem> temp = [];

    for (int i = 0; i < data['data'].length; i++) {
      var currentdata = data['data'][i];
      MovieItem current = MovieItem(currentdata['thumbnail'], currentdata['title']);
      temp.add(current);
    }
    _Items = temp;
  }

  List<MovieItem>? get movieData => _Items;
}

class MovieItem {
  final String imageUrl;
  final String imageName;
  MovieItem(this.imageUrl, this.imageName);
}
