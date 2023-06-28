import 'dart:convert';

class ProfileInfo {
  final String id;
  final String weight;
  final String date;
  ProfileInfo({
    required this.id,
    required this.weight,
    required this.date,
  });

  ProfileInfo copyWith({
    String? id,
    String? weight,
    String? date,
  }) {
    return ProfileInfo(
      id: id ?? this.id,
      weight: weight ?? this.weight,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'weight': weight,
      'date': date,
    };
  }

  factory ProfileInfo.fromMap(Map<String, dynamic> map) {
    return ProfileInfo(
      id: map['id'] as String,
      weight: map['weight'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileInfo.fromJson(String source) =>
      ProfileInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfileInfo(id: $id, weight: $weight, date: $date)';

  @override
  bool operator ==(covariant ProfileInfo other) {
    if (identical(this, other)) return true;

    return other.id == id && other.weight == weight && other.date == date;
  }

  @override
  int get hashCode => id.hashCode ^ weight.hashCode ^ date.hashCode;
}
