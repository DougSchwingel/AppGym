import 'package:flutter/material.dart';
import 'package:gym_app/Classes/exercicio_classe.dart';
import 'package:gym_app/PreparedWidgets/topbar.dart';

class ExerciseInfo extends StatefulWidget {
  const ExerciseInfo({Key? key, required this.exercicioInfo}) : super(key: key);

  final Exercicio exercicioInfo;

  @override
  State<ExerciseInfo> createState() => _ExerciseInfoState();
}

class _ExerciseInfoState extends State<ExerciseInfo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: const TopBar(title: 'Gym Name'),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Center(
                    child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: Image.network(
                        widget.exercicioInfo.gifUrl,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
