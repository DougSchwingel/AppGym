import 'dart:convert';

import 'package:gym_app/Classes/workout_class.dart';

class CalendarEvent {
  final int id;
  final String name;
  final Workout workout;

  CalendarEvent({
    required this.id,
    required this.name,
    required this.workout,
  });

  CalendarEvent copyWith({
    int? id,
    String? name,
    Workout? workout,
  }) {
    return CalendarEvent(
      id: id ?? this.id,
      name: name ?? this.name,
      workout: workout ?? this.workout,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': name,
      'treino': workout.toMap(),
    };
  }

  factory CalendarEvent.fromMap(Map<String, dynamic> map) {
    return CalendarEvent(
      id: map['id'] as int,
      name: map['nome'] as String,
      workout: Workout.fromMap(map['treino'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalendarEvent.fromJson(String source) =>
      CalendarEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CalendarEvent(id: $id, nome: $name, treino: $workout)';

  @override
  bool operator ==(covariant CalendarEvent other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.workout == workout;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ workout.hashCode;
}
