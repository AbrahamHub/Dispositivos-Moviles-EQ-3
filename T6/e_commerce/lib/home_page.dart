import 'package:flutter/material.dart';
import 'models/product.dart';
import 'services/product_service.dart';
import 'api_client.dart';
import 'widgets/category_item.dart';
import 'widgets/button_row.dart';
import 'widgets/product_card.dart';
import 'data/category_data.dart';
import 'custom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    final apiClient = ApiClient('https://app-damp-star-3470.fly.dev/products');
    final productService = ProductService(apiClient);
    _productsFuture = productService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Categorías de ropa
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(blurRadius: 5, spreadRadius: 2),
                ],
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

            // Botones de novedades y ofertas
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


                    ),
                  ),
                ],
              ),
            ),

            // Galería de productos desde la API
            FutureBuilder<List<Product>>(
              future: _productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No se encontraron productos'));
                } else {
                  final products = snapshot.data!;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.network(
                              product.imageUrl,
                              fit: BoxFit.cover,
                              height: 150,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/images/placeholder.png', fit: BoxFit.cover, height: 150);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(product.name, style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('\$${product.price}', style: TextStyle(fontSize: 14, color: Colors.grey)),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
