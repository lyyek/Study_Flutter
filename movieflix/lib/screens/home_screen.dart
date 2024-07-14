import 'package:flutter/material.dart';
import 'package:movieflix/models/movie.dart';
import 'package:movieflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //인기 영화 가져오기
  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white, //글씨 색
        backgroundColor: Colors.teal, //배경 색
        centerTitle: true, //텍스트 가운데 정렬
        title: const Text(
          "MOVIEFLIX",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: popularMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              itemBuilder: (context, index) {
                var movie = snapshot.data![index];
                return Container(
                  width: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                      ),
                    ],
                    // boxShadow: [
                    //   BoxShadow(
                    //     blurRadius: 15,
                    //     offset: const Offset(0, 0),
                    //     color: Colors.black.withOpacity(0.5),
                    //   ),
                    // ],
                  ),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/${movie.thumb}",
                    headers: const {
                      'User-Agent':
                          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                      //'Referer': 'https://comic.naver.com',
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 40,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
