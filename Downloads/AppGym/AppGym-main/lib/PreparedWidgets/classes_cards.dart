import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClassesCard extends StatefulWidget {
  ClassesCard({
    Key? key,
    required this.nome,
    required this.icone,
    required this.time,
    this.info,
    this.trailingIcon,
    required this.button1,
  }) : super(key: key);

  TimeOfDay time;
  String nome;
  Widget icone;
  String? info;
  Widget? trailingIcon;
  ElevatedButton button1;

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
              //Constróis cards
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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: widget.time,
                                    builder: (context, child) => MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            alwaysUse24HourFormat: true),
                                        child: child!),
                                  );
                                  setState(
                                    () {
                                      if (newTime == null) {
                                        return;
                                      }
                                      widget.time = newTime;
                                      widget.nome = widget.nome.toString();
                                      widget.time = newTime;
                                      widget.icone = const Icon(Icons.class_);
                                      widget.trailingIcon = Image.asset(
                                          'assets/icons/open_darkmode.png');
                                    },
                                  );
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Editar horário',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              widget.button1,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
