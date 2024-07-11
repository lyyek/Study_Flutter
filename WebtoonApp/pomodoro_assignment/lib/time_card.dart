import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class timeCard extends StatelessWidget {
  final String val;

  const timeCard({
    super.key,
    required this.val,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      //alignment: Alignment.bottomCenter,
      child: Text(
        val,
        //format(totalSeconds),
        style: TextStyle(
          color: Theme.of(context).colorScheme.background,
          fontSize: 80,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
