import 'package:flutter/material.dart';

void main() {
  runApp(App()); //runApp: widget 타입을 인자로 가짐(widget: ui를 만드는 레고 블럭)
  //class를 만들어서 widget을 만들 수 있음
  //find widgets in flutter widget catalog)
}

//root widget->returns material(google)/cupertino(ios) widget
class App extends StatelessWidget{ //flutter sdk에 있는 3개의 core widget 중에 하나를 extend하는 class->widget
  //all widget->build method(ui를 build해줌) 구현해야함
  
  @override
  Widget build(BuildContext context) {//return->show up on the screen
    return MaterialApp(
      //home: Text('Hello World'), //home에서 뭐가 보이게 할 것인가

      home: Scaffold(
        backgroundColor: Color(0xFF1818), //hexadecimal로 색상 입히기
        //다른 방법: Color.fromARGB()
        body: 
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            ),//all(10): 상하좌우 모두에 padding 10 주기
          child: Column( //stack해서 쌓으려면 column을 사용
            children: [
              SizedBox(//공간 만들기
                height: 80,
              ),
              Row(//수평으로 stack
                mainAxisAlignment: //정렬(mainaxis->horizontal) //row의 main: 수평
                MainAxisAlignment.end,
                children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,//hello selena~back 모두 다 오른쪽에 붙여버리기
                     children: [
                        Text(
                          'Hey, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28, //크기
                            fontWeight: FontWeight.w800, //두께
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),//1이면 불투명
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
  //scaffold: structure of the screen
}