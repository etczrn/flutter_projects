import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class FakeProductRepository {
  // * _() for singleton (private constructor)
  FakeProductRepository._();
  static FakeProductRepository instance = FakeProductRepository._();

  final List<Product> _products = kTestProducts;

  List<Product> getProductList() {
    return _products;
  }

  // * Reason that the return type is nullabe is
  // * that we may or may not get a match depending on the ID
  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  // * Methods returning a Future will begin with fetch
  // * Suited for REST APIs
  Future<List<Product>> fetchProductList() {
    return Future.value(_products);
  }

  // * Methods returning a Stream will begin with watch
  // * Suited for real time API based on web socket
  Stream<List<Product>> watchProductList() {
    return Stream.value(_products);
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}
