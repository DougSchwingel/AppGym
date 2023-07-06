import 'package:flutter/material.dart';
import 'package:gym_app/Classes/workout_class.dart';

class WorkoutBuilderCard extends StatefulWidget {
  const WorkoutBuilderCard({
    Key? key,
    required this.nome,
    this.info,
    required this.lExer,
    required this.id,
  }) : super(key: key);

  final String nome;
  final String? info;
  final int id;
  final List<Workout> lExer;

  @override
  State<WorkoutBuilderCard> createState() => _WorkoutBuilderCardState();
}

class _WorkoutBuilderCardState extends State<WorkoutBuilderCard> {
  bool estado = true;

  @override
  void initState() {
    super.initState();
  }

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
                setState(() {
                  estado = !estado;
                  widget.lExer.add(Workout(
                      name: widget.nome,
                      info: widget.info != null ? widget.info! : ''));
                });
              },
              leading: estado != false
                  ? SizedBox(
                      width: MediaQuery.of(context).size.height * 0.05,
                      child: const Text(''),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.height * 0.05,
                      child: const Icon(Icons.check),
                    ),
              title: widget.info != null
                  ? Text(
                      widget.nome,
                      style: const TextStyle(fontSize: 17),
                    )
                  : Text(
                      widget.nome,
                      style: const TextStyle(fontSize: 20),
                    ),
              subtitle: widget.info != null
                  ? Text(
                      widget.info!,
                      style: const TextStyle(fontSize: 13),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
