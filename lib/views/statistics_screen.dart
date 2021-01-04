import 'package:coronacontacts/models/covid_country_data_model.dart';
import 'package:coronacontacts/models/world_covid_data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flag/flag.dart';
import 'package:coronacontacts/services/api_manager.dart';
import 'package:coronacontacts/constants/maps.dart';
import 'package:coronacontacts/views/widgets/line_chart.dart';


class StatisticsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StatisticsScreenState();
  }
}

class StatisticsScreenState extends State<StatisticsScreen> {

  /*======= SERVICE FUNCTIONS ========*/

  final numberFormatter = new NumberFormat("#,###");

  String signOfNumber(number) {
    if (number < 0) {
      return '- ';
    } else {
      return '+ ';
    }
  }

  Future<CovidCountryData> _covidGermanyData;
  Future<List<WorldCovidDataModel>> _covidWorldData;

  @override
  void initState() {
    super.initState();
    _covidGermanyData = ApiManager().fetchCountryData();
    _covidWorldData = ApiManager().fetchWorldData();
  }

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

  Widget _buildTopStatistic(infected, differenceInfected, recovered, differenceRecovered, deaths, differenceDeaths) {
    return Container(
      height: 140, 
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildTopStatisticContainer('Active Cases', (infected - recovered - deaths), (differenceInfected - differenceRecovered - differenceDeaths), Color(0xFFFFAA22), Icons.privacy_tip),
            SizedBox(width: 10),
            _buildTopStatisticContainer('Deaths', deaths, differenceDeaths, Color(0xFFEE4444), Icons.airline_seat_flat),
            SizedBox(width: 10),
            _buildTopStatisticContainer('Recoveries', recovered, differenceRecovered, Color(0xFF66BB66), Icons.sentiment_satisfied),
            SizedBox(width: 10),
            _buildTopStatisticContainer('Infections', infected, differenceInfected, Color(0xFF991AC7), Icons.privacy_tip),            
          ],
        )
    );
  }

  Widget _buildColouredNumber(number, color){
    return Text(
      numberFormatter.format(number),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23,
        color: color,
      ),
    );
  }

  Widget _buildDifferenceNumber(number, color){
    return Container(
      decoration: new BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: new BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Padding(padding: EdgeInsets.only(bottom: 3, top: 3, left: 10, right: 10), child: Text(
        signOfNumber(number) + numberFormatter.format(number.abs()),
        style: TextStyle(
          fontSize: 15,
          color: color,
        )
      )
    ));
  }

  Widget _buildUppercaseHeading(text, fontsize){
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

  Widget _buildBlueThinText(text, fontsize){
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: Color(0xFF0213B5),
      ),
    );
  }

  Widget _buildCircledIcon(color, icon){
    return Container(
      height: 30,
      width: 30,
      decoration: new BoxDecoration(
        color: color.withOpacity(0.2),
        border: Border.all(color: color),
        borderRadius: new BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: 18.0,
    ),
      )
    );
  }

  Widget _buildTopStatisticContainer(text, number, differenceNumber, color, icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 150,
      child: Padding(
        padding: EdgeInsets.all(10), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildUppercaseHeading(text, 12.0)),
                _buildCircledIcon(color, icon),
              ],
            ),
            SizedBox(height: 20),
            _buildColouredNumber(number, color),
            SizedBox(height: 10),
            _buildDifferenceNumber(differenceNumber, color),
          ],
        )
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
          //Align( alignment: Alignment.centerLeft, child: _buildBlueThinText('+20.000 new cases', 25.0)),
          SizedBox(height: 130, width: 280, child: PointsLineChart.withSampleData()),
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

  Widget _buildLoadingSpinner() {
    return CircularProgressIndicator(
      value: null,
      backgroundColor: Colors.grey,
    );
  }


  Widget _buildStatisticTableContainer(country, active, critical, cases, deaths, recoveries) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Row(children: [
        Expanded(child: Flag(country, height: 25, width: 25)),
        Expanded(child: _buildStatisticTableCell('Active', active, Color(0xFFFFAA22))),
        Expanded(child: _buildStatisticTableCell('Critical', critical, Colors.blue)),
        Expanded(child: _buildStatisticTableCell('Cases', cases, Color(0xFF991AC7))),
        Expanded(child: _buildStatisticTableCell('Deaths', deaths, Color(0xFFEE4444))),
      ],)
    );
  }

  Widget _buildStatisticTableCell(description, number, color){
    return Column(children: [
      _buildColouredText(NumberFormat.compact().format(number), color),
      SizedBox(height: 5),
      _buildSmallDescription(description)
    ]);
  }

  Widget _buildSmallDescription(description) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildColouredText(text, color){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: color,
      ),
    );
  }

  Widget _buildStatisticTable() {
    return FutureBuilder<List<WorldCovidDataModel>>(
      future: _covidWorldData,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return SizedBox(height: 390, child: ListView.builder(
            primary: false,
            itemCount: 15,
            itemBuilder: (context, index) {
              var country = snapshot.data[index+1];
              if (country.recovered == null || country.active == null) {
                return SizedBox(height: 0);
              } else {
                return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: _buildStatisticTableContainer(Maps().countryName_to_Code[country.country], country.active, country.critical, country.cases, country.deaths, country.recovered),
              );
              }
            }
          ));
        } else {
          return _buildLoadingSpinner();
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _covidGermanyData,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Something went wrong');
          return null;
        }

        // Once complete, show application
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              children: [
                SizedBox(height: 2),
                _buildHeadingText('Daily Update', 30.0),
                SizedBox(height: 10),
                _buildDayText(snapshot.data.lastUpdate),
                SizedBox(height: 40),
                _buildHeadingText('Germany', 18.0),
                SizedBox(height: 30),
                // infected, differenceInfected, recovered, differenceRecovered, deaths, differenceDeaths
                _buildTopStatistic(snapshot.data.cases, snapshot.data.differenceCases, snapshot.data.recovered, snapshot.data.differenceRecovered, snapshot.data.deaths, snapshot.data.differenceDeaths),
                SizedBox(height: 10),
                _buildSecondStatistic(),
                SizedBox(height: 30),
                _buildHeadingText('Most Infected Countries', 18.0),
                SizedBox(height: 20),
                _buildStatisticTable()
                //_buildStatisticTableContainer('AU', 22195067, 106025, 82439369, 1799337, 58444965),
                //SizedBox(height: 5),
                //_buildStatisticTableContainer('US', 7786653, 29132, 19977704, 346579, 11844472),
              ],
            )
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return _buildLoadingSpinner();
    });
  }
}