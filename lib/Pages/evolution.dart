import 'package:flutter/material.dart';

class EvolutionPage extends StatefulWidget {
  const EvolutionPage({super.key});

  @override
  State<EvolutionPage> createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text('Evolution'),
    );
  }
}
