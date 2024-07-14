import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/services/api_service.dart';

import '../widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //생성자에서 초기화가 어려울 경우 함수(initstate)로 초기화
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs; //선호도
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance(); //폰에 접근
    final likedToons =
        prefs.getStringList('likedToons'); //likedtoons라는 리스트 있는지 확인
    if (likedToons != null) {
      //리스트 이미 있음 -> 해당 웹툰 id가 likedToons에 들어가있는지 확인
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      //리스트 생성
      await prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    //초기화
    //build 전 딱 한 번만 호출
    super.initState();
    //초기화하기 위해서 id가 필요해서 이렇게 stateful로 바꿔서 진행한 것임
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);

    initPrefs();
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        ///아마 좋아한 상태인데 또 누름
        likedToons.remove(widget.id); //하트 취소
      } else {
        likedToons.add(widget.id); //하트 추가
      }
      await prefs.setStringList('likedToons', likedToons); //폰에 저장
      setState(() {
        isLiked = !isLiked; //하트 아이콘 바꿔주기
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //widget.속성: 자기가 속한 StatefulWidge의 data를 받아옴
    return Scaffold(
      //scaffold 가져와야함
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, //appbar 음영(인데 안 생겨서 아래 두 줄 코드 추가)
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        foregroundColor: Colors.teal, //글씨 색
        backgroundColor: Colors.white, //배경 색
        centerTitle: true, //텍스트 가운데 정렬
        title: Text(
          widget.title, //stateful로 바꾸면 widget.title로 바뀜(widget=detail_screen)
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                //이미지가 중앙에 놓이게
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id, //같은 id끼리 묶임
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Image.network(
                        widget.thumb,
                        headers: const {
                          'User-Agent':
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                          'Referer': 'https://comic.naver.com',
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${snapshot.data!.genre}/${snapshot.data!.age}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!.length > 10
                            ? snapshot.data!.sublist(0, 10)
                            : snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
                          )
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
