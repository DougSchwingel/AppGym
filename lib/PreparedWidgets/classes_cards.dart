import 'package:flutter/material.dart';

class ClassesCard extends StatefulWidget {
  const ClassesCard({
    Key? key,
    required this.nome,
    required this.icone,
    required this.time,
    this.info,
    this.trailingIcon,
  }) : super(key: key);

  final TimeOfDay time;
  final String nome;
  final Widget icone;
  final String? info;
  final Widget? trailingIcon;

  @override
  State<ClassesCard> createState() => _ClassesCardState();
}

class _ClassesCardState extends State<ClassesCard> {
  @override
  Widget build(BuildContext context) {
    String hour = widget.time.hour.toString().padLeft(2, '0');
    String minute = widget.time.minute.toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
      child: Card(
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
                'Dia: ${widget.nome}',
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                'Horário: $hour:$minute',
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.height * 0.04,
                child: widget.trailingIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
