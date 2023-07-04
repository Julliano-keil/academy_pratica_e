import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<void> baixarImagens(List<String> urls) async {
  for (int i = 0; i < urls.length; i++) {
    String url = urls[i];
    String nomeImagem = 'imagem${i + 1}.jpg';

    print('Iniciando download da imagem $nomeImagem');

    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    File(nomeImagem).writeAsBytes(bytes);

    print('Download da imagem $nomeImagem concluído');
  }
}

Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  await baixarImagens(urls);
}
