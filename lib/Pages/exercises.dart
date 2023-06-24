import 'package:flutter/material.dart';
import 'package:gym_app/PreparedWidgets/searchbar.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  TextEditingController _searchController = TextEditingController();
  bool isSearchVisible = false;

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
        body: SingleChildScrollView(
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
            ],
          ),
        ),
      ),
    );
  }
}
