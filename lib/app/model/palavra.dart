import 'dart:convert';

class Palavra {
  final int id;
  final String titulo;
  final String palavras;
  final String autor;
  final String data;

  Palavra({
    this.id,
    this.titulo,
    this.palavras,
    this.autor,
    this.data,
  });

  Palavra copyWith({
    int id,
    String titulo,
    String palavras,
    String autor,
    String data,
  }) {
    return Palavra(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      palavras: palavras ?? this.palavras,
      autor: autor ?? this.autor,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'palavras': palavras,
      'autor': autor,
      'data': data,
    };
  }

  factory Palavra.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Palavra(
      id: map['id'],
      titulo: map['titulo'],
      palavras: map['palavras'],
      autor: map['autor'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Palavra.fromJson(String source) =>
      Palavra.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Palavra(id: $id, titulo: $titulo, palavras: $palavras, autor: $autor, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Palavra &&
        o.id == id &&
        o.titulo == titulo &&
        o.palavras == palavras &&
        o.autor == autor &&
        o.data == data;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        palavras.hashCode ^
        autor.hashCode ^
        data.hashCode;
  }
}
