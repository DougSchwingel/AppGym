import 'package:flutter/material.dart';
import 'package:gym_app/Pages/classes.dart';
import 'package:gym_app/Pages/evolution.dart';
import 'package:gym_app/Pages/exercises.dart';
import 'package:gym_app/Pages/workout.dart';
import 'package:gym_app/PreparedWidgets/topbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const WorkoutPage(),
    const ExercisesPage(),
    const ClassPage(),
    const EvolutionPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Gym Name'),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 152, 0),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.description), label: 'Treinos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Exercícios'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Aulas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Evolução'),
        ],
      ),
    );
  }
}
