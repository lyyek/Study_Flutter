import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //gestureDetector: 동작 감지
      onTap: () {
        //Navigator: 화면 전환(사실 그냥 widget rendering)
        Navigator.push(
          context,
          MaterialPageRoute(
            //route:stateless widget을 애니메이션 효과로 감싸서 스크린처럼 보이게 함
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            fullscreenDialog: true, //이미지가 바닥에서 올라오게함(설정 안하면 옆으로 처리됨)
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            //해당 이미지가 중간에 오면서 다음 화면의 이미지랑 이어지는 느낌의 애니메이션 줌
            //detail_screen과 home의 같은 이미지로 묶이게해줌
            tag: id,
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
                thumb,
                headers: const {
                  'User-Agent':
                      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
