import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/product.dart';

class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}