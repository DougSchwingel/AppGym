import 'package:flutter/material.dart';

class GymCards extends StatefulWidget {
  const GymCards({Key? key, required this.nome, required this.icone})
      : super(key: key);

  final String nome;
  final Image icone;

  @override
  State<GymCards> createState() => _GymCardsState();
}

class _GymCardsState extends State<GymCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
      child: Card(
        //color: const Color.fromRGBO(31, 27, 36, 0.5),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.10,
          child: Center(
            child: ListTile(
              leading: SizedBox(
                width: MediaQuery.of(context).size.height * 0.05,
                child: widget.icone,
              ),
              title: Text(
                widget.nome,
                style: TextStyle(fontSize: 20),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
