import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  //변경되는 속성들
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final _blackColor = const Color(0xFF1F2123); //변수명 앞에 _ -> private
  final double offsetX, offsetY;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.offsetX,
    required this.offsetY,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Transform.translate(
      offset: Offset(offsetX, offsetY),
      child: Container(
        //cards
        clipBehavior: Clip.hardEdge, //item overflow되면 어떻게 처리할 것인가
        decoration: BoxDecoration(
          color: isInverted
              ? Colors.white
              : _blackColor, //isInverted면 white, 아니면 black
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted
                              ? _blackColor
                              : Colors.white.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                //icon overflow되게
                scale: 2.2, //2.2배로
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    //아이콘 추가하기
                    //Icons.euro_rounded,
                    icon,
                    color: isInverted ? _blackColor : Colors.white,
                    size:
                        88, //size를 무작정 늘리면 카드 사이즈도 함께 늘어나기 때문에 transform.scale을 사용
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
