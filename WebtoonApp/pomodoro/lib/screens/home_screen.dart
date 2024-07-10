import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async'; //timer 불러오려면

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer; //버튼 누를 때만 활성화 될 것임

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      //0에 도달하면 초기화
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        //state 변경
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    //periodic: duration마다 timer 실행
    //1초마다 onTick 실행
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    //stop timer
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void stopPressed() {
    timer.cancel();
    totalSeconds = twentyFiveMinutes;
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    //분이랑 초로 나눠 보여주기
    var duration =
        Duration(seconds: seconds); //duration이 0:24:52.000000 이런 형태를 가짐
    return duration
        .toString()
        .split(".")
        .first
        .substring(2, 7); //문자열로 바꾼 후 .를 기준으로 분리
    //분리하면 list([0:24:50, 000000])로 나오는데 그 중에서 앞 부분만 꺼내기
    //0:24:50에서 2번째부터 꺼내기(잘 모르겠으면 콘솔에 print 해볼 것)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1, //flex: 상대적 비율 결정
            child: Container(
              //decoration: const BoxDecoration(color: Colors.red),
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              //decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                    ),
                  ),
                  IconButton(
                    iconSize: 60,
                    color: Theme.of(context).cardColor,
                    onPressed: stopPressed,
                    icon: const Icon(
                      Icons.stop_circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  //화면 상에서 확장하게 해줌
                  child: Container(
                    //decoration: const BoxDecoration(color: Colors.blue),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 54,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
