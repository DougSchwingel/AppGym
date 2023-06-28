import 'dart:convert';

class Exercise {
  final String bodyPart;
  final String equipment;
  final String gifUrl;
  final String id;
  final String name;
  final String target;
  Exercise({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
  });

  Exercise copyWith({
    String? bodyPart,
    String? equipment,
    String? gifUrl,
    String? id,
    String? name,
    String? target,
  }) {
    return Exercise(
      bodyPart: bodyPart ?? this.bodyPart,
      equipment: equipment ?? this.equipment,
      gifUrl: gifUrl ?? this.gifUrl,
      id: id ?? this.id,
      name: name ?? this.name,
      target: target ?? this.target,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bodyPart': bodyPart,
      'equipment': equipment,
      'gifUrl': gifUrl,
      'id': id,
      'name': name,
      'target': target,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      bodyPart: map['bodyPart'] as String,
      equipment: map['equipment'] as String,
      gifUrl: map['gifUrl'] as String,
      id: map['id'] as String,
      name: map['name'] as String,
      target: map['target'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise.fromJson(String source) =>
      Exercise.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Exercicio(bodyPart: $bodyPart, equipment: $equipment, gifUrl: $gifUrl, id: $id, name: $name, target: $target)';
  }

  @override
  bool operator ==(covariant Exercise other) {
    if (identical(this, other)) return true;

    return other.bodyPart == bodyPart &&
        other.equipment == equipment &&
        other.gifUrl == gifUrl &&
        other.id == id &&
        other.name == name &&
        other.target == target;
  }

  @override
  int get hashCode {
    return bodyPart.hashCode ^
        equipment.hashCode ^
        gifUrl.hashCode ^
        id.hashCode ^
        name.hashCode ^
        target.hashCode;
  }
}
