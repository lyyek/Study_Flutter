import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon.dart';
import 'package:webtoon/services/api_service.dart';

import '../widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // 방법1: stateful widget 사용하기
  // List<WebtoonModel> webtoons = [];
  // bool isLoading = true;

  // //http request 기다림
  // void watiForWebtoons() async {
  //   webtoons =
  //       await ApiService.getTodaysToons(); //데이터 가져와서 webtoons에 넣기(initState 이용)
  //   isLoading = false;
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   watiForWebtoons();
  // }

  //방법2: futurebuilder 사용
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, //appbar 음영(인데 안 생겨서 아래 두 줄 코드 추가)
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        foregroundColor: Colors.teal, //글씨 색
        backgroundColor: Colors.white, //배경 색
        centerTitle: true, //텍스트 가운데 정렬
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        //builder(UI 그려줌) 요구
        future: webtoons, //await 안 써도됨(얘가 알아서 해줘서)
        builder: (context, snapshot) {
          //snapshot: state of future
          if (snapshot.hasData) {
            //여러 항목 나열해주기 -> ListView
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          //return const Text("Loading...");
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      //.builder가 더 최적화된 버전(ListView:전체, builder: 필요한 것만 불러옴)
      scrollDirection: Axis.horizontal,
      //list의 아이템 개수
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        //build되는 아이템의 idx에 접그 가능
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      //.separated는 아이템 사이에 구분자까지 넣어줌
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
