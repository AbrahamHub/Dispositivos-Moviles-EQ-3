import 'package:flutter/material.dart';

class Category {
  final String imagePath;
  final String label;

  Category({
    required this.imagePath,
    required this.label,
  });
}

final List<Category> categories = [
  Category(imagePath: 'assets/mujer.jpg', label: 'Mujer'),
  Category(imagePath: 'assets/hombre.webp', label: 'Hombre'),
  Category(imagePath: 'assets/niño.jpg', label: 'Niños'),
  Category(imagePath: 'assets/deportiva.png', label: 'Deportiva'),
  Category(imagePath: 'assets/vestido.jpg', label: 'Vestidos'),
  Category(imagePath: 'assets/bano.jpg', label: 'Trajes de Baño'),
];