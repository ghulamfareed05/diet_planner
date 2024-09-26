// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../size_config.dart';

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
class _WeightData {
  _WeightData(this.week, this.weight);

  final String week;
  final double weight;
}

class WeightTrackerScreen extends StatefulWidget {
  @override
  _WeightTrackerScreenState createState() => _WeightTrackerScreenState();
}

class _WeightTrackerScreenState extends State<WeightTrackerScreen> {
  List<_WeightData> weeklyData = [
    _WeightData('Week 1', 0),

  ];
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  List<_WeightData> monthlyData = [
    _WeightData('Month 1', 0),

  ];

  TextEditingController weightController = TextEditingController();

  void addWeight(String week) {
    if (weightController.text.isNotEmpty) {
      setState(() {
        final double weight = double.parse(weightController.text);
        final _WeightData newData = _WeightData(week, weight);
        weeklyData.add(newData);
        monthlyData.add(newData);
        weightController.clear();
      });
    }
  }
  // Widget bottomTitleWidgets(double value, TitleMeta meta) {
  //   const style = TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 16,
  //   );
  //   Widget text;
  //   switch (value.toInt()) {
  //     case 2:
  //       text = const Text('MAR', style: style);
  //       break;
  //     case 5:
  //       text = const Text('JUN', style: style);
  //       break;
  //     case 8:
  //       text = const Text('SEP', style: style);
  //       break;
  //     default:
  //       text = const Text('', style: style);
  //       break;
  //   }
  //
  //   return SideTitleWidget(
  //     axisSide: meta.axisSide,
  //     child: text,
  //   );
  // }
  //
  // Widget leftTitleWidgets(double value, TitleMeta meta) {
  //   const style = TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 15,
  //   );
  //   String text;
  //   switch (value.toInt()) {
  //     case 1:
  //       text = '10K';
  //       break;
  //     case 3:
  //       text = '30k';
  //       break;
  //     case 5:
  //       text = '50k';
  //       break;
  //     default:
  //       return Container();
  //   }
  //
  //   return Text(text, style: style, textAlign: TextAlign.left);
  // }
  // LineChartData mainData() {
  //   return LineChartData(
  //     gridData: FlGridData(
  //       show: true,
  //       drawVerticalLine: true,
  //       horizontalInterval: 1,
  //       verticalInterval: 1,
  //       getDrawingHorizontalLine: (value) {
  //         return const FlLine(
  //           color: AppColors.mainGridLineColor,
  //           strokeWidth: 0,
  //         );
  //       },
  //       getDrawingVerticalLine: (value) {
  //         return const FlLine(
  //           color: AppColors.mainGridLineColor,
  //           strokeWidth: 0,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           reservedSize: 30,
  //           interval: 1,
  //           getTitlesWidget: bottomTitleWidgets,
  //         ),
  //       ),
  //       leftTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           interval: 1,
  //           getTitlesWidget: leftTitleWidgets,
  //           reservedSize: 42,
  //         ),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: false,
  //       border: Border.all(color: const Color(0xff37434d)),
  //     ),
  //     minX: 0,
  //     maxX: 11,
  //     minY: 0,
  //     maxY: 6,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: const [
  //           FlSpot(0, 3),
  //           FlSpot(2.6, 2),
  //           FlSpot(4.9, 5),
  //           FlSpot(6.8, 3.1),
  //           FlSpot(2, 5),
  //           FlSpot(9.5, 3),
  //           FlSpot(11, 4),
  //         ],
  //         isCurved: true,
  //         gradient: LinearGradient(
  //           colors: gradientColors,
  //         ),
  //         barWidth: 5,
  //         isStrokeCapRound: true,
  //         dotData: const FlDotData(
  //           show: false,
  //         ),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           gradient: LinearGradient(
  //             colors: gradientColors
  //                 .map((color) => color.withOpacity(0.3))
  //                 .toList(),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:

       SizedBox(
         width: double.infinity,
         child: Padding(
           padding:
           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),


              // SizedBox(
              //   height: 300,
              //   width: 350,
              //   child: LineChart(mainData()),
              // ),

              Expanded(
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: const ChartTitle(text: 'Weekly Weight Analysis'),
                  // Enable legend
                  legend: const Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<_WeightData, String>>[
                    LineSeries<_WeightData, String>(
                      dataSource: weeklyData,
                      xValueMapper: (_WeightData data, _) => data.week,
                      yValueMapper: (_WeightData data, _) => data.weight,
                      name: 'Weight',

                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
              // Monthly chart
              Expanded(
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Monthly Weight Analysis'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<_WeightData, String>>[
                    LineSeries<_WeightData, String>(
                      dataSource: monthlyData,
                      xValueMapper: (_WeightData data, _) => data.week,
                      yValueMapper: (_WeightData data, _) => data.weight,
                      name: 'Weight',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
              // Input field for adding weight
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Enter weight',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  ElevatedButton(
                    onPressed: () => addWeight('Week ${weeklyData.length + 1}'),
                    child: const Text('Add Weight'),
                  ),
                ],
              ),
            ],
                 ),
         ),
       ),
    );
  }
}


