import 'package:flutter/material.dart';
import 'custom_button.dart'; // Asegúrate de que este archivo esté creado

class ButtonRow extends StatefulWidget {
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  String selectedButton = 'Novedades';

  void _onButtonPressed(String label) {
    setState(() {
      selectedButton = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          icon: Icons.new_releases_rounded,
          label: 'Novedades',
          isSelected: selectedButton == 'Novedades',
          onPressed: () => _onButtonPressed('Novedades'),
        ),
        const SizedBox(width: 8.0),
        CustomButton(
          icon: Icons.discount_rounded,
          label: 'Ofertas',
          isSelected: selectedButton == 'Ofertas',
          onPressed: () => _onButtonPressed('Ofertas'),
        ),
      ],
    );
  }
}
