import 'package:flutter/material.dart';

class GymCards extends StatefulWidget {
  const GymCards({
    Key? key,
    required this.nome,
    required this.icone,
    required this.info,
    this.trailingIcon,
    this.onTap,
  }) : super(key: key);

  final String nome;
  final Widget icone;
  final String info;
  final Widget? trailingIcon;
  final void Function()? onTap;

  @override
  State<GymCards> createState() => _GymCardsState();
}

class _GymCardsState extends State<GymCards> {
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
