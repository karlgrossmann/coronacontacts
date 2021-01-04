/// Line chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PointsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PointsLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory PointsLineChart.withSampleData() {
    return new PointsLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesCovid, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesCovid(new DateTime(2020, 9, 19), 6431),
      new TimeSeriesCovid(new DateTime(2020, 9, 20), 6592),
      new TimeSeriesCovid(new DateTime(2020, 9, 21), 7030),
      new TimeSeriesCovid(new DateTime(2020, 9, 22), 6437),
      new TimeSeriesCovid(new DateTime(2020, 9, 23), 6793),
      new TimeSeriesCovid(new DateTime(2020, 9, 24), 8952),
      new TimeSeriesCovid(new DateTime(2020, 9, 25), 8301),
    ];

    return [
      new charts.Series<TimeSeriesCovid, DateTime>(
        id: 'New Covid Cases',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesCovid cases, _) => cases.time,
        measureFn: (TimeSeriesCovid cases, _) => cases.cases,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class TimeSeriesCovid {
  final DateTime time;
  final int cases;

  TimeSeriesCovid(this.time, this.cases);
}
