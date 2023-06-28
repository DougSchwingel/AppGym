import 'package:flutter/material.dart';

class ExercisesCard extends StatefulWidget {
  const ExercisesCard({
    Key? key,
    required this.nome,
    this.icone,
    this.info,
    this.trailingIcon,
    this.onTap,
    this.estado,
  }) : super(key: key);

  final String nome;
  final bool? estado;
  final Widget? icone;
  final String? info;
  final Widget? trailingIcon;
  final void Function()? onTap;

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
                leading: widget.estado != false
                    ? SizedBox(
                        width: MediaQuery.of(context).size.height * 0.05,
                        child: widget.icone,
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
                        style: TextStyle(fontSize: 13),
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
