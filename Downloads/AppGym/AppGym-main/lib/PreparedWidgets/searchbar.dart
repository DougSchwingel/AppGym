import 'package:flutter/material.dart';

class GymSearchBar extends StatefulWidget {
  const GymSearchBar(
      {super.key, required this.controller1, required this.texto});

  final TextEditingController controller1;
  final String texto;

  @override
  State<GymSearchBar> createState() => _GymSearchBarState();
}

class _GymSearchBarState extends State<GymSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: SearchBar(
        controller: widget.controller1,
        hintText: 'Pesquisar',
        leading: const Icon(Icons.search),
        onChanged: (value) {},
      ),
    );
  }
}
