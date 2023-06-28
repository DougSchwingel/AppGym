import 'package:flutter/material.dart';
import 'package:gym_app/BD/workout_dao.dart';
import 'package:gym_app/Pages/build_workout.dart';
import 'package:gym_app/PreparedWidgets/searchbar.dart';
import 'package:gym_app/PreparedWidgets/workout_card.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  void initState() {
    super.initState();
    loadWorkouts();
  }

  List<WorkoutCard> treinos = [];
  int i = 0;
  TextEditingController _searchController = TextEditingController();
  bool isSearchVisible = false;
  List<WorkoutCard> Workouts = [];

  Future<void> loadWorkouts() async {
    List<WorkoutCard> lW = await WorkoutDAO.loadWorkouts();

    for (var element in lW) {
      Workouts.add(element);
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
                child: GymSearchBar(
                  texto: 'Procurar Treinos',
                  controller: _searchController,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Workouts.length,
                  itemBuilder: (context, index) {
                    return Workouts[index];
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 255, 152, 0),
                        ),
                      ),
                      onPressed: () async {
                        final updatedWorkouts = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuildWorkout(
                              onUpdateWorkouts: (newWorkouts) {
                                setState(() {
                                  Workouts = newWorkouts;
                                });
                              },
                            ),
                          ),
                        );

                        if (updatedWorkouts != null) {
                          setState(() {
                            Workouts = updatedWorkouts;
                          });
                        }
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
                    ElevatedButton(
                        onPressed: () {
                          loadWorkouts();
                        },
                        child: Icon(Icons.refresh))
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
