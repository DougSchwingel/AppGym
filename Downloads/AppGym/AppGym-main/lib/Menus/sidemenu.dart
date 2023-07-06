import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 35, 35, 35),
      alignment: Alignment.topRight,
      child: SizedBox(
        child: Column(
          children: [
            const Material(
              child: ListTile(
                title: Text('MENU'),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Container(
                  alignment: const Alignment(-0.5, 0),
                  child: Image.asset('assets/icons/conta.png'),
                ),
              ),
            ),
            const Material(
              child: ListTile(
                title: Text(
                    'NOME: '), //criar variaveis de nome, idade, altura, peso
              ),
            ),
            const Material(
              child: ListTile(
                title: Text('IDADE: '),
              ),
            ),
            const Material(
              child: ListTile(
                title: Text('ALTURA: '),
              ),
            ),
            const Material(
              child: ListTile(
                title: Text('PESO: '),
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
