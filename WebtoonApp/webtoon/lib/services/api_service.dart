import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  //baseUrl과 today endpoint로 API url 만들어줌
  //Future로 return 타입 감싸줘야함
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    //http 패키지 설치하기
    //pub.dev가서 확인
    //flutter pub add http

    //uri parsing
    final url = Uri.parse('$baseUrl/$today');
    //get 인자로 uri 넘겨줘야함
    //Future: 미래에 받을 값의 타입
    //Response: 반환된 응답
    //async programming: api 요청이 처리돼서 응답을 반환할 때까지 기다리기
    //await: 이 함수 마무리 될 때까지 기다려라 -> async 사용해야됨
    final response = await http.get(url); //api 서버에 요청
    if (response.statusCode == 200) {
      //print(response.body);
      //string->json
      //이걸 dynamic List로 받아오기
      final List<dynamic> webtoons = jsonDecode(response.body); 
      for (var webtoon in webtoons) {
        //print(webtoon);
        //final toon = WebtoonModel.fromJson(webtoon);
        //print(toon.title);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //string type인 response를 json으로 바꾸기
      final webtoon = jsonDecode(response.body);
      //json을 webtoondetailmodel의 생성자로 보내기
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  //에피소드 리스트 받아오기
  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    //받아올 리스트
    List<WebtoonEpisodeModel> episodesInstances = [];

    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
