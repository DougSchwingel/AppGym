import 'package:flutter/material.dart';
import 'package:gym_app/BD/exercises_dao.dart';
import 'package:gym_app/Classes/exercicio_class.dart';
import 'package:gym_app/Pages/exerciseinfo_page.dart';
import 'package:gym_app/PreparedWidgets/exercises_card.dart';
import 'package:gym_app/PreparedWidgets/return_button.dart';
import 'package:gym_app/PreparedWidgets/searchbar.dart';
import 'package:gym_app/PreparedWidgets/topbar.dart';

class ExercisesBP extends StatefulWidget {
  const ExercisesBP({Key? key, required this.bodypart}) : super(key: key);

  final String bodypart;

  @override
  State<ExercisesBP> createState() => _ExercisesBPState();
}

class _ExercisesBPState extends State<ExercisesBP> {
  List<ExercisesCard> bParts = [];
  TextEditingController _searchController = TextEditingController();
  bool isSearchVisible = false;

  @override
  void initState() {
    super.initState();
    loadBodyPartCounts();
  }

  Future<void> loadBodyPartCounts() async {
    List<Exercise> listaExercicios =
        await ExerciseDAO.loadExercisesByBP(widget.bodypart);
    for (Exercise exer in listaExercicios) {
      bParts.add(
        ExercisesCard(
          nome: exer.name.toUpperCase(),
          info: exer.equipment.toUpperCase(),
          icone: Image.asset('assets/icons/exercise_darkmode.png'),
          trailingIcon: Image.asset('assets/icons/open_darkmode.png'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseInfo(
                  exercicioInfo: exer,
                ),
              ),
            );
          },
        ),
      );
    }
    setState(() {});
  }

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: GymSearchBar(
                  texto: 'Procurar Exercício',
                  controller: _searchController,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: bParts.length,
                  itemBuilder: (context, index) {
                    return bParts[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
