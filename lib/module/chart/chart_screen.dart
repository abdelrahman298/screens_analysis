import 'package:screens_analysis/layout/cubit/home_cubit.dart';
import 'package:screens_analysis/layout/cubit/home_state.dart';
import 'package:screens_analysis/model/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';

class ChartScreen extends StatefulWidget {
  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  TooltipBehavior? _tooltipBehavior;

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var chartList = HomeCubit.get(context).chartData;
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: SfCartesianChart(
              title: ChartTitle(text: 'Monthely sales analysis'),
              legend: Legend(isVisible: true),
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries>[
                LineSeries<ChartModel, double>(
                    name: 'Sales',
                    dataSource: chartList,
                    xValueMapper: (ChartModel sales, _) => sales.date,
                    yValueMapper: (ChartModel sales, _) => sales.noOfOrders,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true)
              ],
              primaryXAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              primaryYAxis: NumericAxis(
                labelFormat: '{value}',
                // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                numberFormat:
                    NumberFormat.compactCurrency(symbol: '', decimalDigits: 0),
              ),
            ),
          ),
        );
      },
    );
  }
}
