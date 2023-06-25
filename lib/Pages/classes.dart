import 'package:flutter/material.dart';
import 'package:gym_app/PreparedWidgets/calendar.dart';
import 'package:gym_app/PreparedWidgets/classes_cards.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  TextEditingController _searchController = TextEditingController();
  bool isSearchVisible = false;
  List<ClassesCard> _aulasFuturas = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleDaySelected(DateTime day) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Calendar(
                aulasFuturas: _aulasFuturas,
                onDaySelected: _handleDaySelected,
                onAulasFuturasChanged: () {
                  setState(
                      () {}); // Notifica a mudança para reconstruir a lista
                },
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _aulasFuturas.length,
                  itemBuilder: (context, index) {
                    return _aulasFuturas[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
