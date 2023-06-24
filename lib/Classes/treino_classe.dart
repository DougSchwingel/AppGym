import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:gym_app/Classes/exercicio_classe.dart';

class Treino {
  final int? id; // Alterado para aceitar valor nulo
  final String nome;
  final List<Exercicio> exercicios;
  Treino({
    this.id, // Atualizado para aceitar valor nulo
    required this.nome,
    required this.exercicios,
  });

  Treino copyWith({
    int? id,
    String? nome,
    List<Exercicio>? exercicios,
  }) {
    return Treino(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      exercicios: exercicios ?? this.exercicios,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'exercicios': exercicios.map((x) => x.toMap()).toList(),
    };
  }

  factory Treino.fromMap(Map<String, dynamic> map) {
    return Treino(
      id: map['id'] as int?, // Alterado para aceitar valor nulo
      nome: map['nome'] as String,
      exercicios: List<Exercicio>.from(
        (map['exercicios'] as List<int>).map<Exercicio>(
          (x) => Exercicio.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Treino.fromJson(String source) =>
      Treino.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Treino(id: $id, nome: $nome, exercicios: $exercicios)';

  @override
  bool operator ==(covariant Treino other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        listEquals(other.exercicios, exercicios);
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ exercicios.hashCode;
}
