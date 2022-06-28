import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerador de nomes"),
        backgroundColor: Colors.deepPurple[400],
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
    fontSize: 18
  );

  @override
  Widget build(BuildContext context) {
    // ListView com Scroll infinito
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      }
    );
  }
}