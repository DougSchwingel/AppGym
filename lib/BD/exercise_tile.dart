import 'package:flutter/material.dart';
import 'package:gym_app/Classes/exercicio_classe.dart';

class ExerciseTile extends StatelessWidget {
  const ExerciseTile({
    super.key,
    required this.exercicio,
  });

  final Exercicio exercicio;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(exercicio.name),
      subtitle: Text(exercicio.bodyPart),
      leading: SizedBox(width: 150, child: Text(exercicio.id)),
    );
  }
}
