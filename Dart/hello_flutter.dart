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
        appBar: AppBar(
          title:Text('Hello Flutter'),
          ),
        body: Center(
          child: Text('Hello World!'),
          ),
        ),
    );
  }
  //scaffold: structure of the screen
}