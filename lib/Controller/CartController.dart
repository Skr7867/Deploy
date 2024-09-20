import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/ProductModel.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  double get totalPrice => cartItems.fold(0.0, (sum, item) => sum + item.price);

  int get itemCount => cartItems.length;

  void addToCart(Product product) {
    cartItems.add(product);

    saveCart();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    Get.snackbar("Successfully", "${product.name} Removed from Cart!",
        backgroundColor: Colors.blue.shade300);
    saveCart();
  }

  void saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartStrings =
        cartItems.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList('cart', cartStrings);
  }

  void loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartStrings = prefs.getStringList('cart');
    if (cartStrings != null) {
      cartItems.value = cartStrings
          .map((item) => Product.fromJson(jsonDecode(item)))
          .toList();
    }
  }
}

extension ProductExtension on Product {
  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'description': description,
        'price': price,
      };
}
