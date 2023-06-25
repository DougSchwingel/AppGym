import 'package:flutter/material.dart';
import 'package:gym_app/BD/exercises_dao.dart';
import 'package:gym_app/Classes/exercicio_classe.dart';
import 'package:gym_app/PreparedWidgets/cards.dart';
import 'package:gym_app/PreparedWidgets/searchbar.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  List<GymCards> bParts = [];
  Future<List<Exercicio>> exercicios = ExerciseDAO.carregarExercicios();
  TextEditingController _searchController = TextEditingController();
  bool isSearchVisible = false;

  @override
  void initState() {
    super.initState();
    loadBodyPartCounts();
  }

  Future<void> loadBodyPartCounts() async {
    List<Exercicio> listaExercicios = await exercicios;
    for (Exercicio exer in listaExercicios) {
      bParts.add(
        GymCards(
          nome: exer.bodyPart,
          info: exer.equipment,
          icone: Image.asset('assets/icons/exercise_darkmode.png'),
          trailingIcon: Image.asset('assets/icons/open_darkmode.png'),
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
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: SearchBar(
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
