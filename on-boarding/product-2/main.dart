import 'dart:io';
import 'product_manager.dart';

// Helper functions for input
String getStringInput(String prompt) {
  print(prompt);
  return stdin.readLineSync() ?? '';
}

double getDoubleInput(String prompt) {
  while (true) {
    print(prompt);
    try {
      return double.parse(stdin.readLineSync() ?? '0');
    } catch (e) {
      print('❌ Invalid number. Please try again.');
    }
  }
}

int getIntInput(String prompt) {
  while (true) {
    print(prompt);
    try {
      return int.parse(stdin.readLineSync() ?? '0');
    } catch (e) {
      print('❌ Invalid ID. Please enter a number.');
    }
  }
}

void main() {
  var manager = ProductManager();
  bool isRunning = true;

  while (isRunning) {
    print('\n' + '=' * 50);
    print('          📦 PRODUCT MANAGEMENT SYSTEM');
    print('=' * 50);
    print('1. ➕ Add Product');
    print('2. 📋 View All Products');
    print('3. 🔍 View Single Product');
    print('4. ✏️  Edit Product');
    print('5. 🗑️  Delete Product');
    print('6. 🚪 Exit');
    print('=' * 50);
    print('Choose an option (1-6): ');
    
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('\n--- Add New Product ---');
        String name = getStringInput('Enter product name: ');
        String description = getStringInput('Enter product description: ');
        double price = getDoubleInput('Enter product price: ');
        manager.addProduct(name, description, price);
        break;

      case '2':
        print('\n--- All Products ---');
        manager.viewAllProducts();
        break;

      case '3':
        print('\n--- View Product ---');
        int id = getIntInput('Enter product ID: ');
        manager.viewProduct(id);
        break;

      case '4':
        print('\n--- Edit Product ---');
        int id = getIntInput('Enter product ID: ');
        String newName = getStringInput('Enter new name: ');
        String newDescription = getStringInput('Enter new description: ');
        double newPrice = getDoubleInput('Enter new price: ');
        manager.editProduct(id, newName, newDescription, newPrice);
        break;

      case '5':
        print('\n--- Delete Product ---');
        int id = getIntInput('Enter product ID: ');
        manager.removeProduct(id);
        break;

      case '6':
        isRunning = false;
        print('\n👋 Goodbye! Thanks for using the Product Management System.');
        break;

      default:
        print('❌ Invalid option. Please choose 1-6.');
    }
  }
}