import 'package:flutter/material.dart';
import 'package:gym_app/BD/exercises_dao.dart';
import 'package:gym_app/BD/workout_dao.dart';
import 'package:gym_app/Classes/exercicio_class.dart';
import 'package:gym_app/Classes/workout_class.dart';
import 'package:gym_app/PreparedWidgets/return_button.dart';
import 'package:gym_app/PreparedWidgets/topbar.dart';
import 'package:gym_app/PreparedWidgets/wbuilder_card.dart';
import 'package:gym_app/PreparedWidgets/workout_card.dart';

class BuildWorkout extends StatefulWidget {
  const BuildWorkout({
    Key? key,
    required this.onUpdateWorkouts,
  }) : super(key: key);

  final Function(List<WorkoutCard>) onUpdateWorkouts;

  @override
  State<BuildWorkout> createState() => _BuildWorkoutState();
}

class _BuildWorkoutState extends State<BuildWorkout> {
  bool isSearchVisible = false;
  List<WorkoutBuilderCard> allCards = [];
  List<Workout> lExers = [];
  List<String> bodyparts = [
    "back",
    "cardio",
    "chest",
    "lower arms",
    "lower legs",
    "neck",
    "shoulders",
    "upper arms",
    "upper legs",
    "waist"
  ];
  String selectedBodyPart = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> lWorkouts() async {
    allCards.clear();
    List<Exercise> listaExercicios =
        await ExerciseDAO.loadExercisesByBP(selectedBodyPart.toLowerCase());

    for (int i = 0; i < listaExercicios.length; i++) {
      int id = int.parse(listaExercicios[i].id);
      WorkoutBuilderCard wb = WorkoutBuilderCard(
        id: id,
        nome: listaExercicios[i].name.toUpperCase(),
        info: listaExercicios[i].equipment.toUpperCase(),
        lExer: lExers,
      );
      allCards.add(wb);
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
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: DropdownButton<String>(
                  hint: Text(selectedBodyPart),
                  items: bodyparts.map((String bodyPart) {
                    return DropdownMenuItem<String>(
                      value: bodyPart.toUpperCase(),
                      child: Text(bodyPart.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBodyPart = newValue ?? '';
                      lWorkouts();
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allCards.length,
                  itemBuilder: (context, index) {
                    return allCards[index];
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 255, 152, 0),
                    ),
                  ),
                  onPressed: () {
                    WorkoutDAO.insert(lExers);
                  },
                  child: const Text(
                    'Criar Treino',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
