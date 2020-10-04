

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
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
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2020, 9, 10), 10),
      new TimeSeriesSales(new DateTime(2020, 9, 11), 25),
      new TimeSeriesSales(new DateTime(2020, 9, 12), 30),
      new TimeSeriesSales(new DateTime(2020, 9, 13), 55),
      new TimeSeriesSales(new DateTime(2020, 9, 14), 66),
      new TimeSeriesSales(new DateTime(2020, 9, 15), 53),
      new TimeSeriesSales(new DateTime(2020, 9, 17), 72),
      new TimeSeriesSales(new DateTime(2020, 9, 18), 64),
      new TimeSeriesSales(new DateTime(2020, 9, 19), 43),
      new TimeSeriesSales(new DateTime(2020, 9, 20), 39),
      new TimeSeriesSales(new DateTime(2020, 9, 22), 52),
      new TimeSeriesSales(new DateTime(2020, 9, 23), 64),
      new TimeSeriesSales(new DateTime(2020, 9, 24), 70),
      new TimeSeriesSales(new DateTime(2020, 9, 26), 75),
      new TimeSeriesSales(new DateTime(2020, 9, 27), 69),
      new TimeSeriesSales(new DateTime(2020, 9, 28), 43),
      new TimeSeriesSales(new DateTime(2020, 9, 29), 56),
      new TimeSeriesSales(new DateTime(2020, 9, 30), 50),
      new TimeSeriesSales(new DateTime(2020, 10, 3), 43),

    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}