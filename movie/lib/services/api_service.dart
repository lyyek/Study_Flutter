import 'dart:convert'; //jsonDecode 함수 쓰려면
import 'package:movie/models/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";

  //baseUrl과 endpoint로 API url 만들어줌
  //Future로 return 타입 감싸줘야함
  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    //uri parsing
    final url = Uri.parse('$baseUrl/$popular');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(
          response.body)["results"]; //map 형태라서 ["results"] 부분을 따로 떼서 리스트로 가져오기
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }
}
