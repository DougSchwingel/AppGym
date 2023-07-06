import 'package:flutter/material.dart';
import 'package:gym_app/BD/db_helper.dart';
import 'package:gym_app/PreparedWidgets/exercises_card.dart';
import 'package:gym_app/PreparedWidgets/exercises_selector.dart';
import 'package:gym_app/PreparedWidgets/searchbar.dart';

import 'exercises_bp.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({Key? key}) : super(key: key);

  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final TextEditingController _searchController = TextEditingController();
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
  List<ExercisesCard> bParts = [];

  @override
  void initState() {
    super.initState();
    loadBodyPartCounts();
  }

  Future<void> loadBodyPartCounts() async {
    for (String bodypart in bodyparts) {
      bParts.add(
        ExercisesCard(
          nome: bodypart.toUpperCase(),
          icone: Image.asset('assets/icons/exercise_darkmode.png'),
          trailingIcon: Image.asset('assets/icons/open_darkmode.png'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExercisesBP(bodypart: bodypart),
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
    return FutureBuilder<void>(
      future: DBHelper.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao criar o banco de dados'));
        } else {
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
                        GymSearchBar(
                          texto: 'Procurar Exercícios',
                          controller1: _searchController,
                        ),
                      ],
                    ),
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
      },
    );
  }
}
