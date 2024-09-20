import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Model/ProductModel.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs; // All products
  var filteredProducts = <Product>[].obs; // Filtered products based on search
  var searchQuery = ''.obs; // Search query

  @override
  void onInit() {
    super.onInit();
    loadProductsFromJson();
  }

  // Load products from a JSON file
  Future<void> loadProductsFromJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/products.json');
      final List<dynamic> data = jsonDecode(response);

      products.value =
          data.map((product) => Product.fromJson(product)).toList();
      filteredProducts.value = products; // Initially show all products
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  // Filter products by search query
  void filterProducts(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredProducts.value = products;
    } else {
      filteredProducts.value = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
