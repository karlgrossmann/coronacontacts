import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class PercentageIndicator extends StatelessWidget {

  const PercentageIndicator({Key key, this.percentage}) : super(key: key);

  final int percentage;

  @override
  Widget build(BuildContext context) {
    if(percentage <= 40) {
      return new LinearPercentIndicator(
        width: 150.0,
        lineHeight: 15.0,
        percent: (percentage/100),
        progressColor: Colors.green,
        backgroundColor: Color(0xFFF0F0F0),
        center: Text((percentage.toString() + "%"), style: TextStyle(fontSize: 12)),
      );
    } else if(percentage > 40 && percentage <= 80) {
        return new LinearPercentIndicator(
          width: 150.0,
          lineHeight: 15.0,
          percent: (percentage/100),
          progressColor: Colors.orange,
          backgroundColor: Color(0xFFF0F0F0),
          center: Text((percentage.toString() + "%"), style: TextStyle(fontSize: 12)),
        );
    } else if(percentage > 80 && percentage <= 100) {
        return new LinearPercentIndicator(
          width: 150.0,
          lineHeight: 15.0,
          percent: (percentage/100),
          progressColor: Colors.red,
          backgroundColor: Color(0xFFF0F0F0),
          center: Text((percentage.toString() + "%"), style: TextStyle(fontSize: 12, color: Colors.white)),
        );
    }
  }
}