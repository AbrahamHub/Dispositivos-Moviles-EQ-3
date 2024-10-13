import 'package:e_commerce/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/category_item.dart';
import 'widgets/button_row.dart';
import 'widgets/product_card.dart';
import 'data/category_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(),
      body: SingleChildScrollView(
        child: Wrap(
          runSpacing: 10,
          children: [
            // Contenedor para las categorías de ropa
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(blurRadius: 5, spreadRadius: 2),
                ]
                ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 40,
                    runAlignment: WrapAlignment.center,
                    children: [
                      for (var category in categories)
                        CategoryItem(category: category),
                    ],
                  ),
                ),
              ),
            ),

            // Contenedor para los botones de novedades y ofertas
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    child: ButtonRow(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 30,
                      children: [
                        ProductCard(
                          imagePath: 'assets/producto1.png',
                          title: 'Sudadera Hombre',
                          price: '\$10.00',
                        ),
                        ProductCard(
                          imagePath: 'assets/producto2.png',
                          title: 'Blusa Mujer',
                          price: '\$15.00',
                        ),
                        ProductCard(
                          imagePath: 'assets/producto3.png',
                          title: 'Pantalon Niño',
                          price: '\$20.00',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
