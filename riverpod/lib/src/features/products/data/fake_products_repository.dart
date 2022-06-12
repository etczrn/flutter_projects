import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeProductsRepository {
  final List<Product> _products = kTestProducts;

  List<Product> getProductsList() {
    return _products;
  }

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProductsList() async {
    // Test loading, error state
    await Future.delayed(const Duration(seconds: 2));
    // throw Exception();
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() async* {
    await Future.delayed(const Duration(seconds: 2));
    yield _products;
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}

// * Use provider to retrieve the repository
// * How to create providers:
// * - Delcare as a global variable
// * - Specify a type annotation (Provider<T>)
// * - Implement the body (anonymous function)
// * The anonymous function can be quite complex
// * and we can use the ref object to access other providers as dependencies
final productRepositoryProvider = Provider<FakeProductsRepository>((ref) {
  return FakeProductsRepository();
});

final productListStreamProvider = StreamProvider<List<Product>>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.watchProductsList();
});

final productListFutureProvider = FutureProvider<List<Product>>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.fetchProductsList();
});

// * Need to pass an argument to a provider?
// * Use the .family modifier
// * And call 'ref.watch(product(arg))' in your widget

// * Family works with any valid type in Dart
// * - String, int, double, bool
// * - Custom classes implementing hashCode and ==

// * If you end up passing a dynamic list or map of values to a family,
// * you may be doing it wrong
// * There may be a simpler way of designing your providers
final productProvider = StreamProvider.family<Product?, String>((ref, id) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.watchProduct(id);
});
