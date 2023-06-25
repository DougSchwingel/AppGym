import 'package:flutter/material.dart';
import 'package:gym_app/PreparedWidgets/cards.dart';

class ExercisesSelector extends StatefulWidget {
  const ExercisesSelector({super.key, required this.bodyparts});

  final List<GymCards> bodyparts;

  @override
  State<ExercisesSelector> createState() => _ExercisesSelectorState();
}

class _ExercisesSelectorState extends State<ExercisesSelector> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.bodyparts.length,
        itemBuilder: (context, index) {
          return widget.bodyparts[index];
        },
      ),
    );
  }
}
