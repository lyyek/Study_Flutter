import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  //btn이 가져야할 속성
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //container: div 같은 widget
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(45)),
      child: Padding(
        //수정 가능하기 때문에 const이면 안됨
        //없으면 글자에 꽉 맞는 상자가 되어버림
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
