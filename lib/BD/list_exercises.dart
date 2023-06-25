// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:gym_app/Classes/exercicio_classe.dart';

class ListExercises {
  final List<Exercicio> exercicios;
  ListExercises({
    required this.exercicios,
  });

  ListExercises copyWith({
    List<Exercicio>? exercicios,
  }) {
    return ListExercises(
      exercicios: exercicios ?? this.exercicios,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exercicios': exercicios.map((x) => x.toMap()).toList(),
    };
  }

  factory ListExercises.fromMap(Map<String, dynamic> map) {
    return ListExercises(
      exercicios: List<Exercicio>.from(
        (map['exercicios'] as List<int>).map<Exercicio>(
          (x) => Exercicio.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListExercises.fromJson(String source) =>
      ListExercises.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListExercises(exercicios: $exercicios)';

  @override
  bool operator ==(covariant ListExercises other) {
    if (identical(this, other)) return true;

    return listEquals(other.exercicios, exercicios);
  }

  @override
  int get hashCode => exercicios.hashCode;
}
