import 'package:flutter/material.dart';
// english_words - Gera pares de palavras aleatórias.
import 'package:english_words/english_words.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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

  final _saved = <WordPair>{};

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gerador de nomes",
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[400],
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: const Icon(Icons.list),
            tooltip: "Salvar favoritos",
          ),
        ],
      ),
      // ListView com Scroll infinito
      body: ListView.builder(
        // Espaçamento de 16 em todos os lados da lista.
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = _saved.contains(_suggestions[index]);

          return ListTile(
            title: Text(
              // Retorna cada item da lista com a primeira letra de cada palavra em maiúscula.
              _suggestions[index].asPascalCase,
              // Define a fonte como 18 que foi definida na variável "_biggerFont".
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red[800] : null,
              semanticLabel: alreadySaved ? "Remover dos favoritos" : "Favoritar",
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_suggestions[index]);
                } else {
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        }
      ), 
    );
  }
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList() : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text("Salvar favoritos"),
            ),
            body: ListView(padding: const EdgeInsets.all(16), children: divided),
          );
        }
      )
    );
  }
}

