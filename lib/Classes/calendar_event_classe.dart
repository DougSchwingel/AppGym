import 'dart:convert';

import 'package:gym_app/Classes/treino_classe.dart';

class CalendarEvent {
  final int id;
  final String nome;
  final Treino treino;

  CalendarEvent({
    required this.id,
    required this.nome,
    required this.treino,
  });

  CalendarEvent copyWith({
    int? id,
    String? nome,
    Treino? treino,
  }) {
    return CalendarEvent(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      treino: treino ?? this.treino,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'treino': treino.toMap(),
    };
  }

  factory CalendarEvent.fromMap(Map<String, dynamic> map) {
    return CalendarEvent(
      id: map['id'] as int,
      nome: map['nome'] as String,
      treino: Treino.fromMap(map['treino'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalendarEvent.fromJson(String source) =>
      CalendarEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CalendarEvent(id: $id, nome: $nome, treino: $treino)';

  @override
  bool operator ==(covariant CalendarEvent other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome && other.treino == treino;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ treino.hashCode;
}
