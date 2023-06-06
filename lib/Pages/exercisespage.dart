import 'package:flutter/material.dart';
import 'package:gym_app/PreparedWidgets/bottombar.dart';
import 'package:gym_app/PreparedWidgets/topbar.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Gym Name'),
      //body: ,
      bottomNavigationBar: const BottomBar(),
    );
  }
}
