class VersiculoQueries {
  // ignore: non_constant_identifier_names
  static final String LISTA_PAGINADA = ''' 
  query MyQuery {
    versiculos(order_by: {data: desc}) {
      data
      id
      referencia
      versiculos
  }
}
''';
}
