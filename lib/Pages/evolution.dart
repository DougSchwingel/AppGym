import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gym_app/BD/profile_dao.dart';
import 'package:gym_app/Classes/profile_info_class.dart';
import 'package:gym_app/PreparedWidgets/evolution_chart.dart';

class EvolutionPage extends StatefulWidget {
  const EvolutionPage({super.key});

  @override
  State<EvolutionPage> createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage> {
  List<double> pesos = [
    10.5,
    20,
    18.7,
    22.6,
    47.8,
    29.1,
    16.9,
    26.8,
    7.9,
    12.4,
    20,
    28,
    29.2
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                'Evolução de Peso',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 255, 152, 0),
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          EvolutionChart(
            data: pesos,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                'Evolução de IMC',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 255, 152, 0),
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          EvolutionChart(
            data: pesos,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
          )
        ],
      ),
    );
  }
}
