import 'package:flutter/material.dart';
import 'home_page.dart'; // Asegúrate de importar tu archivo de página principal

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoStore', // Puedes cambiar el título de la aplicación aquí
      debugShowCheckedModeBanner: false, // Quita el banner de depuración

      home: HomePage(), // Usa la clase HomePage como la página principal
    );
  }
}
