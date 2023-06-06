import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  DrawerHeader(
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Text(
                        'Calculadora de IMC',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
