import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.indigo,
          border: Border.all(color: Colors.teal, width: 8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: Checkbox.width,

          children: [
            formatarTexto("Nome: Lázaro Pedro"),
            formatarTexto("Cidade: Guanambi"),
            formatarTexto("Frase Curta: Hoje é 25 de fevereiro de 2025"),
            ElevatedButton(
              onPressed: () => print("Hoje é 25 de fevereiro de 2025"),
              child: Text("Exibir Mensagem"),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget formatarTexto(String texto) {
  return Text(texto, style: TextStyle(fontSize: 20));
}

