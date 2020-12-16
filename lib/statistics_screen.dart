import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StatisticsScreenState();
  }
}

class StatisticsScreenState extends State<StatisticsScreen> {

  /*===== BUILD ITEMS =======*/

  Widget _buildHeadingText(text, size) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text, 
        style: TextStyle(
          fontSize: size, 
          color: Color(0xFF0213B5), 
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildDayText(text){
    return Align(
      alignment: Alignment.centerLeft, 
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFFBBC2CF),
        )
      ),
    );
  }

  Widget _buildTopStatistic(infected, recovered, deaths) {
    return Container(
      height: 200, 
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildTopStatisticContainer('Infected', infected, Color(0xFFFFAA22), Icons.privacy_tip),
            SizedBox(width: 10),
            _buildTopStatisticContainer('Recovered', recovered, Color(0xFF66BB66), Icons.sentiment_satisfied),
            SizedBox(width: 10),
            _buildTopStatisticContainer('Death', recovered, Color(0xFFEE4444), Icons.airline_seat_flat),
          ],
        )
    );
  }

  _buildColouredNumber(number, color){
    return Text(
      number.toString(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: color,
      ),
    );
  }

  _buildUppercaseHeading(text, fontsize){
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontsize,
        letterSpacing: 0.3,
        color: Color(0xFFBBC2CF),
      ),
    );
  }

    _buildBlueThinText(text, fontsize){
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: Color(0xFF0213B5),
      ),
    );
  }

  _buildCircledIcon(color, icon){
    return Container(
      height: 50,
      width: 50,
      decoration: new BoxDecoration(
        color: color.withOpacity(0.2),
        border: Border.all(color: color),
        borderRadius: new BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: 24.0,
    ),
      )
    );
  }

  Widget _buildTopStatisticContainer(text, number, color, icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 150,
      child: Column(
        children: [
          SizedBox(height: 30),
          _buildCircledIcon(color, icon),
          SizedBox(height: 30),
          _buildColouredNumber(number, color),
          _buildUppercaseHeading(text, 11.0),
        ],
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 2), 
          )
        ]
      ),
    );
  }

  Widget _buildSecondStatistic() {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 200,
      width: 100,
      child: Column(
        children: [
          Align( alignment: Alignment.centerLeft, child: _buildUppercaseHeading('LAST 7 DAYS', 14.0)),
          SizedBox(height: 5),
          Align( alignment: Alignment.centerLeft, child: _buildBlueThinText('+20.000 new cases', 25.0)),
        ],
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 2), 
          )
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(24.0),
        children: [
          SizedBox(height: 50),
          _buildHeadingText('Daily Update', 30.0),
          SizedBox(height: 10),
          _buildDayText('Wed, 20 Dec 2020'),
          SizedBox(height: 40),
          _buildHeadingText('Germany', 18.0),
          SizedBox(height: 40),
          _buildTopStatistic(790, 31, 58),
          SizedBox(height: 10),
          _buildSecondStatistic(),
        ],
      )
    );
  }

}