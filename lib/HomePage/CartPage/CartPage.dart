import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/CartController.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.itemCount,
                itemBuilder: (ctx, index) {
                  final product = cartController.cartItems[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade100),
                    child: ListTile(
                      leading: Image.asset(product.imageUrl),
                      title: Text(product.name),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cartController.removeFromCart(product);
                        },
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                    'Total: \$${cartController.totalPrice.toStringAsFixed(2)}')),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateColor.resolveWith((state) => Colors.blue),
                  ),
                  onPressed: () {
                    // Checkout functionality
                  },
                  child: const Text(
                    'Checkout',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
