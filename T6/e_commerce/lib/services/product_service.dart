import 'dart:isolate';
import '../api_client.dart';
import '../models/product.dart';

class ProductService {
  final ApiClient apiClient;

  ProductService(this.apiClient);

  Future<List<Product>> fetchProducts() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_fetchProductsIsolate, receivePort.sendPort);

    final sendPort = await receivePort.first as SendPort;
    final response = ReceivePort();
    sendPort.send([response.sendPort, apiClient.baseUrl]);

    return await response.first as List<Product>;
  }

  static void _fetchProductsIsolate(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    final message = await port.first as List;
    final responsePort = message[0] as SendPort;
    final baseUrl = message[1] as String;

    final apiClient = ApiClient(baseUrl);
    final products = await apiClient.fetchProducts();
    responsePort.send(products);
  }
}