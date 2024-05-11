import 'package:flutter/material.dart';
import 'package:toonflix/widgets/Button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App()); //runApp: widget 타입을 인자로 가짐(widget: ui를 만드는 레고 블럭)
  //class를 만들어서 widget을 만들 수 있음
  //find widgets in flutter widget catalog)
}

//root widget->returns material(google)/cupertino(ios) widget
class App extends StatelessWidget {
  const App({super.key});

  //flutter sdk에 있는 3개의 core widget 중에 하나를 extend하는 class->widget
  //all widget->build method(ui를 build해줌) 구현해야함

  @override
  Widget build(BuildContext context) {
    //return->show up on the screen
    return MaterialApp(
      //home: Text('Hello World'), //home에서 뭐가 보이게 할 것인가

      home: Scaffold(
        backgroundColor: const Color(0x00ff1818), //hexadecimal로 색상 입히기
        //다른 방법: Color.fromARGB()
        body: SingleChildScrollView(
          //스크롤 가능하게
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ), //all(10): 상하좌우 모두에 padding 10 주기
            child: Column(
              //stack해서 쌓으려면 column을 사용
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  //공간 만들기
                  height: 80,
                ),
                Row(
                  //수평으로 stack
                  mainAxisAlignment: //정렬(mainaxis->horizontal) //row의 main: 수평
                      MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .end, //hello selena~back 모두 다 오른쪽에 붙여버리기
                      children: [
                        const Text(
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
                            color: Colors.white.withOpacity(0.8), //1이면 불투명
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  //Total balance와 금액 사이 공간
                  height: 5,
                ),
                const Text(
                  '\$5 194 482', //$: text안에 변수 사용할 때 씀 -> $ 그대로 표시하려면 \(escape) 사용
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  //금액과 버튼 사이 공간
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      //button.dart class를 이용해 버튼 만들기
                      text: 'Transfer',
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, //이렇게만 하면 view all이 wallets의 중간 높이에 맞춰지게 됨
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8), //const랑 쓰이면 안됨
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  offsetX: 0,
                  offsetY: 0,
                ),
                const CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 785',
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                  offsetX: 0,
                  offsetY: -20,
                ),
                const CurrencyCard(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '428',
                  icon: Icons.attach_money_outlined,
                  isInverted: false,
                  offsetX: 0,
                  offsetY: -40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //scaffold: structure of the screen
}
