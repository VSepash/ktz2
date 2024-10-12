import './provider/fake_api_provider.dart';

void main() async {
  final provider = FakeApiProvider();
  final result = await provider.fetchCarts();  // Исправлено на fetchCarts
  for (var cart in result) {
    print(cart);
  }
}
