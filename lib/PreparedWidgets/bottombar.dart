import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Evolução'),
      ],
    );
  }
}
