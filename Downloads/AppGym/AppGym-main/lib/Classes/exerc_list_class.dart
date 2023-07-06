import 'dart:convert';

class ListExer {
  int w_id;
  int ex_id;
  ListExer({
    required this.w_id,
    required this.ex_id,
  });

  ListExer copyWith({
    int? w_id,
    int? ex_id,
  }) {
    return ListExer(
      w_id: w_id ?? this.w_id,
      ex_id: ex_id ?? this.ex_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'w_id': w_id,
      'ex_id': ex_id,
    };
  }

  factory ListExer.fromMap(Map<String, dynamic> map) {
    return ListExer(
      w_id: map['w_id'] as int,
      ex_id: map['ex_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListExer.fromJson(String source) =>
      ListExer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListExer(w_id: $w_id, ex_id: $ex_id)';

  @override
  bool operator ==(covariant ListExer other) {
    if (identical(this, other)) return true;

    return other.w_id == w_id && other.ex_id == ex_id;
  }

  @override
  int get hashCode => w_id.hashCode ^ ex_id.hashCode;
}
