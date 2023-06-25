import 'package:flutter/material.dart';
import 'package:gym_app/BD/exercises_dao.dart';
import 'package:gym_app/PreparedWidgets/cards.dart';
import 'package:gym_app/PreparedWidgets/exercises_selector.dart';
import 'package:gym_app/PreparedWidgets/searchbar.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  TextEditingController _searchController = TextEditingController();
  bool isSearchVisible = false;
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
  List<GymCards> bParts = [];

  @override
  void initState() {
    super.initState();
    loadBodyPartCounts();
  }

  Future<void> loadBodyPartCounts() async {
    for (String bodypart in bodyparts) {
      int count = await ExerciseDAO.getCountByBodyPart(bodypart);
      bParts.add(
        GymCards(
          nome: bodypart,
          info: count.toString(),
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
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchBar(
                      texto: 'Procurar Exercícios',
                      controller: _searchController,
                    ),
                  ]),
              const SizedBox(height: 20),
              ExercisesSelector(
                bodyparts: bParts,
              )
            ],
          ),
        ),
      ),
    );
  }
}
