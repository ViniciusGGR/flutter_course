import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final wordPair = WordPair.random();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nomes para Startup"),
        backgroundColor: Colors.deepPurple[400],
        centerTitle: true,
      ),
      body: Center(
        // "PascalCase" - Define que a primeira letra de cada palavra deve ser maiúscula.
        child: Text(wordPair.asPascalCase),
      ),
    );
  }
}
