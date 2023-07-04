import 'dart:async';

Future<String> consultarAPI(String codigoRastreamento) async {
  await Future.delayed(Duration(seconds: 2));

  // Simulacao de consulta a API com codigo de rastreamento
  if (codigoRastreamento == 'ABC123') {
    return 'Em transito';
  } else if (codigoRastreamento == 'XYZ789') {
    return 'Entregue';
  } else if (codigoRastreamento == 'DEF456') {
    return 'Atrasado';
  } else {
    return 'Codigo de rastreamento invalido';
  }
}

Future<void> verificarStatusEntrega(String codigoRastreamento) async {
  String status = await consultarAPI(codigoRastreamento);
  print('Status de entrega do pacote $codigoRastreamento: $status');
}

void main() async {
  print('Inicio');
  List<Future> futures = [
    verificarStatusEntrega('ABC123'),
    verificarStatusEntrega('XYZ789'),
    verificarStatusEntrega('DEF456')
  ];
  await Future.wait(futures);
  print('Fim');
}
