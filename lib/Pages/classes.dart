import 'package:flutter/material.dart';
import 'package:gym_app/PreparedWidgets/searchbar.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  TextEditingController _searchController = TextEditingController();
  bool isSearchVisible = false;

  @override
  void dispose() {
    _searchController
        .dispose(); // Certifique-se de liberar o TextEditingController
    super.dispose();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
