import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Combustível Ideal',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
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
  final gasolinaController = TextEditingController();
  final etanolController = TextEditingController();
  final rendimentoGasolinaController = TextEditingController();
  final rendimentoEtanolController = TextEditingController();

  String resultado = '';

  void calcular() {
    final precoGasolina = double.tryParse(gasolinaController.text) ?? 0;
    final precoEtanol = double.tryParse(etanolController.text) ?? 0;
    final rendimentoGasolina =
        double.tryParse(rendimentoGasolinaController.text) ?? 1;
    final rendimentoEtanol =
        double.tryParse(rendimentoEtanolController.text) ?? 1;

    if (precoGasolina == 0 || precoEtanol == 0) {
      setState(() {
        resultado = 'Preencha os valores corretamente';
      });
      return;
    }

    double custoGasolina = precoGasolina / rendimentoGasolina;
    double custoEtanol = precoEtanol / rendimentoEtanol;

    double percentual = (precoEtanol / precoGasolina) * 100;

    setState(() {
      if (custoEtanol < custoGasolina) {
        resultado =
            '👉 Vale a pena usar ETANOL\n(${percentual.toStringAsFixed(1)}% do preço da gasolina)';
      } else {
        resultado =
            '👉 Vale a pena usar GASOLINA\n(${percentual.toStringAsFixed(1)}% do preço da gasolina)';
      }
    });
  }

  Widget campo(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  void dispose() {
    gasolinaController.dispose();
    etanolController.dispose();
    rendimentoGasolinaController.dispose();
    rendimentoEtanolController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combustível Ideal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            campo('Preço Gasolina (R\$)', gasolinaController),
            const SizedBox(height: 10),
            campo('Preço Etanol (R\$)', etanolController),
            const SizedBox(height: 10),
            campo('Km/L Gasolina', rendimentoGasolinaController),
            const SizedBox(height: 10),
            campo('Km/L Etanol', rendimentoEtanolController),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcular,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 20),

            Text(
              resultado,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}