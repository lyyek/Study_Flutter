import 'package:challenge/taskCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff292929),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 60,
                      ),
                      Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MONDAY 16',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const Text(
                              'TODAY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              '·',
                              style: TextStyle(
                                color: Color(0xff9b2671),
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '17',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Text(
                              '18',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Text(
                              '19',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Text(
                              '20',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const TaskCard(
                  task: 'DESIGN\nMEETING',
                  participants: [
                    'ALEX',
                    'HELENA',
                    'NANA',
                  ],
                  color: Color(0xfffef754),
                  startHour: '11',
                  startMin: '30',
                  endHour: '12',
                  endMin: '20',
                ),
                const SizedBox(height: 10),
                const TaskCard(
                  task: 'DAILY\nPROJECT',
                  participants: ['ME', 'RICHARD', 'CIRY', '+4'],
                  color: Color(0xff9c6bce),
                  startHour: '12',
                  startMin: '35',
                  endHour: '14',
                  endMin: '10',
                ),
                const SizedBox(height: 10),
                const TaskCard(
                  task: 'WEEKLY\nPLANNING',
                  participants: [
                    'DEN',
                    'NANA',
                    'MARK',
                  ],
                  color: Color(0xffbcee4b),
                  startHour: '15',
                  startMin: '00',
                  endHour: '16',
                  endMin: '30',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
