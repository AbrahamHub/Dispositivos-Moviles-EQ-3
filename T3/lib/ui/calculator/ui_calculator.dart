import 'package:flutter/material.dart';
import 'package:medidor_imc/ui/calculator/widgets/widgets_calculator.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorStateUI();
}

class _CalculatorStateUI extends State<CalculatorUI> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  String respuesta = "RESULTADO";
  double imc = 0.0;

  void _calcular() {
    setState(() {
      double peso = double.parse(_pesoController.text);
      double altura = double.parse(_alturaController.text);
      imc = peso / (altura * altura);
      respuesta = imc.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: MyContainer(
            child: Column(
              children: [
                Stack(
                  children: [MyAppContainer()],
                ),
                _sizeEspacio(),
                MyTextInput(inputController: _pesoController, label: "Peso Kg"),
                MyTextInput(inputController: _alturaController, label: "Altura m"),
                MyText(text: respuesta.toString()),
                MyButton(lblText: Text("Calcular"), press: () => _calcular()),
              ],
            ),
          ),
        ),
    );
  }

  Widget _sizeEspacio() {
    return SizedBox(
      height: 30,
    );
  }
}