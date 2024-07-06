import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

//StatefulWidget을 눌러서 상태를 바꿀 수 있음
//State: data 가진 부분(class), UI 속성도 가짐
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //int counter = 0;
  bool showTitle = true;

  void toggleTitle() {
    //showTitle toggle하기
    setState(() {
      showTitle = !showTitle;
    });
  }
  //버튼 클릭될 때 실행할 함수
  // void onClicked() {
  //   //setState(): State 클래스에서 데이터가 변경되었음을 알리는 함수(없으면 build method가 호출되지 않음)
  //   //꼭 setState 안에 변화를 넣을 필요는 없음(따로 빼고 뒤에 setState 함수를 넣어도 됨) but 가독성 때문에 이렇게 하는 것 추천
  //   setState(() {
  //     counter = counter + 1;
  //   });
  //   //counter = counter + 1; -> 여기 있으면 버튼을 눌러도 화면 속 counter 값이 변화없음
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //theme 만들기
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              )
              // Text(
              //   '$counter',
              //   style: const TextStyle(fontSize: 30),
              // ),
              // IconButton(
              //   //아이콘 버튼 넣어주기
              //   iconSize: 40,
              //   //클릭 실행 함수
              //   onPressed: onClicked,
              //   //아이콘 추가
              //   icon: const Icon(Icons.add_box_rounded),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override

  //initState은 항상 build보다 먼저 호출되어야함
  //딱 한 번 호출됨
  void initState() {
    //상태 초기화(대부분 상태변수 쓰니까 필요없음 but 부모에 의존하는 데이터를 초기화해야할 때 있음)
    super.initState();
    print('initState!');
  }

  @override
  void dispose() {
    //위젯 사라지게 하기
    super.dispose();
    print('dispose!');
  }

  //context: 이전의 모든 상위 요소들에 대한 정보(위젯트리)
  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        //상위요소인 theme에 접근해서 색깔 가져옴(context 이용해서 가능)
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
