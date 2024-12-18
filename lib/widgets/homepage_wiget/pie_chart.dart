import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:pie_chart/pie_chart.dart';
enum LegendShape { circle, rectangle }

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  final dataMap = <String,double>{
    "JEE": 2,
    "SSC CGL": 1,
    "Pri": 2
  };
  
  final colorList = <Color>[
    const Color(0xff14B8A6),
    Color(0xffF59E0B),
    Color(0xff6366F1)
    
  ];


  int key = 0;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(seconds: 1),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      ringStrokeWidth: 32,
      // centerText: "HYBRID",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(chartValueBackgroundColor: Colors.transparent,
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}