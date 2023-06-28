import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EvolutionChart extends StatefulWidget {
  const EvolutionChart({super.key, required this.data});

  final List<double> data;

  @override
  State<EvolutionChart> createState() => _EvolutionChartState();
}

class _EvolutionChartState extends State<EvolutionChart> {
  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      return Center(
        child: Text(
          'Não há dados disponíveis',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.width * 0.95,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.orange,
                strokeWidth: 0.3,
                dashArray: [5],
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.orange,
                strokeWidth: 0.3,
                dashArray: [5],
              );
            },
          ),
          minX: 0,
          maxX: 11,
          minY: widget.data.reduce(
                  (value, element) => value < element ? value : element) -
              10,
          maxY: widget.data.reduce(
                  (value, element) => value > element ? value : element) +
              10,
          titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text(
                        'Jan',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 1:
                      return Text(
                        'Fev',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 2:
                      return Text(
                        'Mar',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 3:
                      return Text(
                        'Abr',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 4:
                      return Text(
                        'Mai',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 5:
                      return Text(
                        'Jun',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 6:
                      return Text(
                        'Jul',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 7:
                      return Text(
                        'Ago',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 8:
                      return Text(
                        'Set',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 9:
                      return Text(
                        'Out',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 10:
                      return Text(
                        'Nov',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    case 11:
                      return Text(
                        'Dez',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    default:
                      return Text('');
                  }
                },
              )),
              topTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              )),
              rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              ))),
          lineBarsData: [
            LineChartBarData(
              color: Colors.orange,
              spots: List.generate(
                12,
                (index) => FlSpot(index.toDouble(), widget.data[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
