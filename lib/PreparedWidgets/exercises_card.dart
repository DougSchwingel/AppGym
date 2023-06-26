import 'package:flutter/material.dart';
import 'package:gym_app/Pages/exercises_bp.dart';

class ExercisesCard extends StatefulWidget {
  const ExercisesCard({
    Key? key,
    required this.nome,
    required this.icone,
    this.info,
    this.trailingIcon,
    required this.onTap,
  }) : super(key: key);

  final String nome;
  final Widget icone;
  final String? info;
  final Widget? trailingIcon;
  final void Function() onTap;

  @override
  State<ExercisesCard> createState() => _ExercisesCardState();
}

class _ExercisesCardState extends State<ExercisesCard> {
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
                onTap: widget.onTap,
                leading: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.05,
                  child: widget.icone,
                ),
                title: Text(
                  widget.nome,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: widget.info != null
                    ? Text(
                        widget.info!,
                      )
                    : null,
                trailing: SizedBox(
                    width: MediaQuery.of(context).size.height * 0.04,
                    child: widget.trailingIcon)),
          ),
        ),
      ),
    );
  }
}
