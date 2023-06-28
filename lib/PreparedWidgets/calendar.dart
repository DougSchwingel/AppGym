import 'package:flutter/material.dart';
import 'package:gym_app/Classes/calendar_event_class.dart';
import 'package:gym_app/PreparedWidgets/classes_cards.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
    required this.aulasFuturas,
    required this.onDaySelected,
    required this.onAulasFuturasChanged,
  }) : super(key: key);

  final List<ClassesCard> aulasFuturas;
  final Function(DateTime) onDaySelected;
  final Function() onAulasFuturasChanged;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  TimeOfDay time = const TimeOfDay(hour: 8, minute: 00);
  late Map<DateTime, List<CalendarEvent>>? treinosDiarios;
  var today = DateTime.now();

  void _selectDay(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          daysOfWeekHeight: 20,
          rowHeight: 50,
          locale:
              'pt_BR', //Traduz os meses (traduz os dias também, mas personaliza-los é o mesmo processo de traduzi-los, não vale a pena)

          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              //Builder dos dias
              String dayName;
              if (day.weekday == DateTime.sunday) {
                dayName = 'dom';
              } else if (day.weekday == DateTime.monday) {
                dayName = 'seg';
              } else if (day.weekday == DateTime.tuesday) {
                dayName = 'ter';
              } else if (day.weekday == DateTime.wednesday) {
                dayName = 'qua';
              } else if (day.weekday == DateTime.thursday) {
                dayName = 'qui';
              } else if (day.weekday == DateTime.friday) {
                dayName = 'sex';
              } else if (day.weekday == DateTime.saturday) {
                dayName = 'sab';
              } else {
                dayName = 'ERRO';
              }
              return Center(
                child: Text(
                  dayName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 152, 0),
                  ),
                ),
              );
            },
          ),

          //Definiçõs básicas do calendário
          focusedDay: today,
          firstDay: DateTime.utc(2022, DateTime.now().month),
          lastDay: DateTime.utc(2024, DateTime.now().month),
          startingDayOfWeek: StartingDayOfWeek.sunday,

          headerStyle: const HeaderStyle(
            headerPadding: EdgeInsets.only(top: 0, bottom: 4),
            formatButtonVisible: false,
            titleCentered: true,
          ),

          selectedDayPredicate: (day) =>
              isSameDay(day, today), //Função pra marcar o dia
          onDaySelected: _selectDay,

          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            outsideDaysVisible: false,
            selectedDecoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 152, 0),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.4,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 255, 152, 0),
                ),
              ),
              //Mostra roda de seleção de horários
              onPressed: () async {
                TimeOfDay? newTime = await showTimePicker(
                  context: context,
                  initialTime: time,
                  builder: (context, child) => MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child!),
                );

                setState(
                  () {
                    if (newTime == null) {
                      return;
                    }
                    time = newTime;

                    widget.aulasFuturas.add(
                      //Criando card de aula
                      ClassesCard(
                        nome: today.day.toString(),
                        time: newTime,
                        icone: const Icon(Icons.class_),
                        trailingIcon:
                            Image.asset('assets/icons/open_darkmode.png'),
                        button1: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                String aux = today.day.toString();
                                for (int i = 0;
                                    i < widget.aulasFuturas.length;
                                    i++) {
                                  if (widget.aulasFuturas[i].nome == aux) {
                                    widget.aulasFuturas
                                        .remove(widget.aulasFuturas[i]);
                                  }
                                  Navigator.pop(context);
                                }
                              });
                            },
                            child: const SizedBox(
                              child: Text(
                                'Excluir',
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      ),
                    );
                    widget.onAulasFuturasChanged(); //Atualiza a lista
                  },
                );
              },

              child: const FittedBox(
                child: Text(
                  'Adicionar Aula',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
