import 'dart:convert';

class Workout {
  final int? id;
  final String name;
  final String info;
  Workout({
    this.id,
    required this.name,
    required this.info,
  });

  Workout copyWith({
    int? id,
    String? name,
    String? info,
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      info: info ?? this.info,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': name,
      'info': info,
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['nome'] as String,
      info: map['info'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Workout.fromJson(String source) =>
      Workout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Treino(id: $id, nome: $name, info: $info)';

  @override
  bool operator ==(covariant Workout other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.info == info;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ info.hashCode;
}
