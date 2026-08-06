import 'product.dart';

class ProductManager {
  List<Product> _products = [];
  int _nextId = 1;  // ← Track the next ID

  void addProduct(String name, String description, double price) {
    var product = Product(
      id: _nextId++,  // ← Auto-generate ID
      name: name,
      description: description,
      price: price,
    );
    _products.add(product);
    print('Product added with ID: ${product.id}');
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print('No products available.');
      return;
    }
    
    for (var product in _products) {
      print('ID: ${product.id}, Name: ${product.name}, Description: ${product.description}, Price: \$${product.price}');
    }
  }

  void viewProduct(int id) {
  if (_products.isEmpty) {
    print('No products available.');
    return;
  }

  try {
    var product = _products.firstWhere((p) => p.id == id);
    print('ID: ${product.id}, Name: ${product.name}, Description: ${product.description}, Price: \$${product.price}');
  } catch (e) {
    print('Product with ID $id not found.');
  }
}

  void editProduct(int id, String newName, String newDescription, double newPrice) {
  try {
    var product = _products.firstWhere((p) => p.id == id);
    product.name = newName;
    product.description = newDescription;
    product.price = newPrice;
    print('Product updated successfully!');
  } catch (e) {
    print('Product with ID $id not found.');
  }
}

  void removeProduct(int id) {
  try {
    var product = _products.firstWhere((p) => p.id == id);
    _products.remove(product);
    print('Product removed successfully!');
  } catch (e) {
    print('Product with ID $id not found.');
  }
}

  List<Product> get products => _products;
}
