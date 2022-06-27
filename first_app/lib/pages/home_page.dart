import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu primeiro App"),
        backgroundColor: Colors.deepPurple[400],
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Bem-vindo."),
      ),
    );
  }
}