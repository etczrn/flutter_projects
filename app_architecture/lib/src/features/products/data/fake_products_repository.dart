import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class FakeProductRepository {
  // * _() for singleton (private constructor)
  FakeProductRepository._();
  static FakeProductRepository instance = FakeProductRepository._();
  List<Product> getProductList() {
    return kTestProducts;
  }

  // * Reason that the return type is nullabe is
  // * that we may or may not get a match depending on the ID
  Product? getProduct(String id) {
    return kTestProducts.firstWhere((product) => product.id == id);
  }
}
