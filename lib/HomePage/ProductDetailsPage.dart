import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/CartController.dart';
import '../Model/ProductModel.dart';

class ProductDetailsPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.imageUrl),
            const SizedBox(height: 16),
            Text(product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text(product.description),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateColor.resolveWith(
                  (states) => Colors.blue,
                )),
                onPressed: () {
                  cartController.addToCart(product);
                  Get.snackbar("Successfully", "${product.name} Added to cart!",
                      backgroundColor: Colors.blue.shade300);
                },
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
