class MovieDetailModel {
  final String title, thumb, about;
  final double rate;
  final int id;
  final List<String> genre;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json["original_title"],
        thumb = json["backdrop_path"],
        about = json["overview"],
        rate = json["vote_average"],
        genre = (json["genres"] as List<dynamic>)
            .map((genre) => genre["name"].toString())
            .toList(),
        id = json["id"];

  void checkVal() {
    print(title);
    print(about);
    print(rate);
    print(genre);
  }
}
