import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'time_card.dart';
import 'time_selection_card.dart'; //timer 불러오려면

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTime = 3;
  int totalSeconds = 3;
  bool isRunning = false;
  int totalPomodoros = 0;
  int totalRounds = 0;

  late Timer timer; //버튼 누를 때만 활성화 될 것임

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      //0에 도달하면 초기화
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = selectedTime;
        if (totalPomodoros % 4 == 0) {
          totalRounds = totalRounds + 1;
          totalSeconds = 300; //5분동안 휴식
        }
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
    //초기화(reset)
    timer.cancel();
    totalSeconds = selectedTime;
    setState(() {
      isRunning = false;
      totalPomodoros = 0;
      totalRounds = 0;
    });
  }

  void timePressed15() {
    //시간선택
    setState(() {
      selectedTime = 900;
      totalSeconds = selectedTime;
    });
  }

  void timePressed20() {
    //시간선택
    setState(() {
      selectedTime = 1200;
      totalSeconds = selectedTime;
    });
  }

  void timePressed25() {
    //시간선택
    setState(() {
      selectedTime = 1500;
      totalSeconds = selectedTime;
    });
  }

  void timePressed30() {
    //시간선택
    setState(() {
      selectedTime = 1800;
      totalSeconds = selectedTime;
    });
  }

  void timePressed35() {
    //시간선택
    setState(() {
      selectedTime = 2100;
      totalSeconds = selectedTime;
    });
  }

  String formatMin(int seconds) {
    //분 추출
    var duration =
        Duration(seconds: seconds); //duration이 0:24:52.000000 이런 형태를 가짐
    return duration.toString().split(".").first.substring(2, 4);
  }

  String formatSec(int seconds) {
    //초 추출
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(5, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    top: 30,
                    bottom: 30,
                  ),
                  child: Text(
                    'POMOTIMER',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1, //flex: 상대적 비율 결정
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 120,
                        height: 150,
                        //color: Colors.white.withOpacity(0.3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6,
                      child: Container(
                        width: 120,
                        height: 150,
                        //color: Colors.white.withOpacity(0.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      child: timeCard(
                        val: formatMin(totalSeconds),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  ':',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 120,
                        height: 150,
                        //color: Colors.white.withOpacity(0.3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6,
                      child: Container(
                        width: 120,
                        height: 150,
                        //color: Colors.white.withOpacity(0.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      child: timeCard(
                        val: formatSec(totalSeconds),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: timePressed15,
                      icon: const TimeSelectionCard(
                          interval: '15', isChosen: false),
                    ),
                    IconButton(
                      onPressed: timePressed20,
                      icon: const TimeSelectionCard(
                          interval: '20', isChosen: false),
                    ),
                    IconButton(
                      onPressed: timePressed25,
                      icon: const TimeSelectionCard(
                          interval: '25', isChosen: true),
                    ),
                    IconButton(
                      onPressed: timePressed30,
                      icon: const TimeSelectionCard(
                          interval: '30', isChosen: false),
                    ),
                    IconButton(
                      onPressed: timePressed35,
                      icon: const TimeSelectionCard(
                          interval: '35', isChosen: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              //decoration: const BoxDecoration(color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 100,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning ? Icons.pause_circle : Icons.play_circle,
                    ),
                  ),
                  IconButton(
                    iconSize: 100,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$totalRounds/4',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .color!
                            .withOpacity(0.5),
                      ),
                    ),
                    Text(
                      'ROUND',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.displayLarge!.color,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$totalPomodoros/12',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .color!
                            .withOpacity(0.5),
                      ),
                    ),
                    Text(
                      'GOAL',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.displayLarge!.color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
