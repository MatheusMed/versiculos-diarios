import 'dart:convert';

class Versiculo {
  Versiculo({
    this.id,
    this.versiculos,
    this.data,
    this.referencia,
  });
  final int id;
  final String versiculos;
  final String data;
  final String referencia;

  Versiculo copyWith({
    int id,
    String versiculos,
    String data,
    String referencia,
  }) {
    return Versiculo(
      id: id ?? this.id,
      versiculos: versiculos ?? this.versiculos,
      data: data ?? this.data,
      referencia: referencia ?? this.referencia,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'versiculos': versiculos,
      'data': data,
      'referencia': referencia,
    };
  }

  factory Versiculo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Versiculo(
      id: map['id'],
      versiculos: map['versiculos'],
      data: map['data'],
      referencia: map['referencia'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Versiculo.fromJson(String source) =>
      Versiculo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Versiculo(id: $id, versiculos: $versiculos, data: $data, referencia: $referencia)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Versiculo &&
        o.id == id &&
        o.versiculos == versiculos &&
        o.data == data &&
        o.referencia == referencia;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        versiculos.hashCode ^
        data.hashCode ^
        referencia.hashCode;
  }
}
