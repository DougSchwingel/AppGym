import 'package:flutter/material.dart';
import 'package:gym_app/Classes/exercicio_classe.dart';
import 'package:gym_app/PreparedWidgets/return_button.dart';
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
        appBar: const TopBar(
          title: 'Gym Name',
          returnButton: ReturnButtonApp(),
        ),
        body: Center(
          widthFactor: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
                      child: Text(
                        widget.exercicioInfo.name.toUpperCase(),
                        style: const TextStyle(
                            overflow: TextOverflow.clip,
                            wordSpacing: 5,
                            fontSize: 25,
                            color: Color.fromARGB(255, 255, 152, 0),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: const Color.fromARGB(255, 255, 152, 0),
                        ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: Image.network(
                        widget.exercicioInfo.gifUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(39, 34, 43, 1),
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'DESCRIÇÃO:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'EXERCÍCIO: ${widget.exercicioInfo.name.toUpperCase()}',
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                'EQUIPAMENTO: ${widget.exercicioInfo.equipment.toUpperCase()}',
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                'ALVO: ${widget.exercicioInfo.target.toUpperCase()}',
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                'PARTE DO CORPO: ${widget.exercicioInfo.bodyPart.toUpperCase()}',
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
