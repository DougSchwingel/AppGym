import 'package:flutter/material.dart';
import 'package:gym_app/Classes/exercicio_class.dart';
import 'package:gym_app/Pages/exercises_bp.dart';

class WorkoutCard extends StatefulWidget {
  const WorkoutCard({
    Key? key,
    required this.nome,
    required this.icone,
    required this.info,
    required this.wExer,
    this.trailingIcon,
    required this.id,
  }) : super(key: key);

  final String nome;
  final Widget icone;
  final String info;
  final int id;
  final List<Exercise> wExer;
  final Widget? trailingIcon;

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
      child: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.10,
          child: Center(
            child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExercisesBP(bodypart: widget.nome),
                    ),
                  );
                },
                leading: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.05,
                  child: widget.icone,
                ),
                title: Text(
                  widget.nome,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  widget.info,
                ),
                trailing: SizedBox(
                    width: MediaQuery.of(context).size.height * 0.04,
                    child: widget.trailingIcon)),
          ),
        ),
      ),
    );
  }
}
