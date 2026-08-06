import 'product.dart';

class ProductManager {
  List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
  }

  void viewProducts(int index) {
    for (var product in _products) {
      print('ID: ${product.id}, Name: ${product.name}, Description: ${product.description}, Price: \$${product.price}');
    }
  }

  void viewProduct(int id) {
    var product = _products.firstWhere((product) => product.id == id, orElse: () => throw Exception('Product not found'));
    print('ID: ${product.id}, Name: ${product.name}, Description: ${product.description}, Price: \$${product.price}');
  } 

  void editProduct(Product product, String newName, String newDescription, double newPrice) {
    product.name = newName;
    product.description = newDescription;
    product.price = newPrice;
  }

  void removeProduct(Product product) {
    _products.remove(product);
  }

  List<Product> get products => _products;
}