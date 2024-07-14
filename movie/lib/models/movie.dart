class MovieModel {
  final String title, thumb;
  final int id;

  //named constructor(:)
  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        thumb = json['poster_path'],
        id = json['id'];
}
