import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const FraseDoDiaApp());
}

class FraseDoDiaApp extends StatelessWidget {
  const FraseDoDiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Frase do Dia",
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> frases = [
    "ChatGPT",
    "Lhama",
    "Gemini",
    "Meta AI",
    "Deepseek",
    "Manus"
  ];

  String fraseAtual = "Clique no botão!";
  String imagemAtual = "images/image1.jpg";

  void gerarFrase() {
    final random = Random();

    int numeroFrase = random.nextInt(frases.length);
    int numeroImagem = random.nextInt(5) + 1;

    setState(() {
      fraseAtual = frases[numeroFrase];
      imagemAtual = "images/image$numeroImagem.jpg";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frase do Dia"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(
            imagemAtual,
            height: 250,
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              fraseAtual,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: "serif",
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 30),

          Center(
            child: ElevatedButton(
              onPressed: gerarFrase,
              child: const Text("Nova Frase"),
            ),
          )

        ],
      ),
    );
  }
}