import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key, required this.controller, required this.texto});

  final TextEditingController controller;
  final String texto;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            prefixIcon: const Icon(Icons.search),
            enabledBorder: InputBorder.none,
            hintText: widget.texto,
          ),
        ),
      ),
    );
  }
}
