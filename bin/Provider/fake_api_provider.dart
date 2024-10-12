import 'package:dio/dio.dart';
import '../cart_model.dart';

abstract class FakeApiProviderPaths {
  static const String carts = 'carts';
}

class FakeApiProvider {
  final Dio _client = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com/"));

  Future<List<CartModel>> fetchCarts() async {
    try {
      final response = await _client.get(FakeApiProviderPaths.carts);
      final List<dynamic> cartJsonList = response.data;

      return cartJsonList.map((json) => CartModel.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching carts: $e');
      rethrow;
    }
  }
}
