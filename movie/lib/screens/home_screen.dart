import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/screens/detail_screen.dart';
import 'package:movie/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //인기 영화 가져오기
  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();

  //상영중인 영화 가져오기
  final Future<List<MovieModel>> releasedMovies =
      ApiService.getReleasedMovies();

  final Future<List<MovieModel>> upcomingMovies =
      ApiService.getUpcomingMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white, //글씨 색
        backgroundColor: Colors.black, //배경 색
        centerTitle: true, //텍스트 가운데 정렬
        title: const Text(
          "MOVIEFLIX",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Text(
                "Popular Movies🔥",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      itemBuilder: (context, index) {
                        var movie = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //route:stateless widget을 애니메이션 효과로 감싸서 스크린처럼 보이게 함
                                builder: (context) => DetailScreen(
                                    title: movie.title,
                                    thumb: movie.thumb,
                                    id: movie.id),
                                fullscreenDialog:
                                    true, //이미지가 바닥에서 올라오게함(설정 안하면 옆으로 처리됨)
                              ),
                            );
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  offset: const Offset(0, 0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/${movie.thumb}",
                              headers: const {
                                'User-Agent':
                                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                                //'Referer': 'https://comic.naver.com',
                              },
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Text(
                "Now in Cinemas🍿",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 370,
              child: FutureBuilder(
                future: releasedMovies,
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    title: movie.title,
                                    thumb: movie.thumb,
                                    id: movie.id),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  offset: const Offset(0, 0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                  "https://image.tmdb.org/t/p/w500/${movie.thumb}",
                                  height: 300,
                                  headers: const {
                                    'User-Agent':
                                        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
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
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                "Coming soon🏃",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 370,
              child: FutureBuilder(
                future: upcomingMovies,
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    title: movie.title,
                                    thumb: movie.thumb,
                                    id: movie.id),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  offset: const Offset(0, 0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                  "https://image.tmdb.org/t/p/w500/${movie.thumb}",
                                  height: 200,
                                  headers: const {
                                    'User-Agent':
                                        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
