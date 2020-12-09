class PalavraQueries {
  // ignore: non_constant_identifier_names
  static final String PALAVRA_LISTA_PAGINADA = ''' 
query MyQuery {
  palavras(order_by: {data: desc}) {
    data
    titulo
    palavras
    id
    autor
  }
}
''';
}
