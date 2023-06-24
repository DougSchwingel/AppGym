import 'package:flutter/material.dart';
import 'package:gym_app/PreparedWidgets/cards.dart';
import 'package:gym_app/PreparedWidgets/searchbar.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  List<GymCards> treinos = [];
  int i = 0;
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
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: SearchBar(
                  texto: 'Procurar Treinos',
                  controller: _searchController,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: treinos.length,
                  itemBuilder: (context, index) {
                    return treinos[index];
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
                    setState(() {
                      treinos.add(
                        GymCards(
                          nome: 'Treino $i',
                          icone:
                              Image.asset('assets/icons/exercise_darkmode.png'),
                        ),
                      );
                      i++;
                    });
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
