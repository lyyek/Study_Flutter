import 'package:flutter/material.dart';

class TimeSelectionCard extends StatelessWidget {
  final String interval; //시간 간격
  final bool isChosen; //선택 여부

  const TimeSelectionCard({
    super.key,
    required this.interval,
    required this.isChosen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            !isChosen ? Theme.of(context).colorScheme.background : Colors.white,
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
        child: Text(
          interval,
          style: TextStyle(
            color: !isChosen
                ? Colors.white
                : Theme.of(context).colorScheme.background,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
