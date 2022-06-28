import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gerador de nomes",
          style: TextStyle(
            color: Colors.black
          )
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Center(
        child: RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  // Lista que salva as palavras sugeridas.
  final _suggestions = <WordPair>[];

  // Variável que define uma fonte maior.
  final _biggerFont = const TextStyle(
    // Define o tamanho da fonte como 18.
    fontSize: 18,
    // Define o peso da fonte como 600.
    fontWeight: FontWeight.w600,
    // Definindo a cor do Texto.
    color: Colors.black54
  );

  @override
  Widget build(BuildContext context) {
    // ListView com Scroll infinito
    return ListView.builder(
      // Espaçamento de 16 em todos os lados da lista.
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return ListTile(
          title: Text(
            // Retorna cada item da lista com a primeira letra de cada palavra em maiúscula.
            _suggestions[index].asPascalCase,
            // Define a fonte como 18 que foi definida na variável "_biggerFont".
            style: _biggerFont,
          ),
        );
      }
    );
  }
}