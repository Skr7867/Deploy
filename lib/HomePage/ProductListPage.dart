import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/ProductController.dart';

class ProductListPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text('MyMart'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Get.toNamed('/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
              onChanged: (value) {
                // Call filterProducts when the user types in the search bar
                productController.filterProducts(value);
              },
            ),
          ),

          // Product List
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: productController.filteredProducts.length,
                itemBuilder: (ctx, index) {
                  final product = productController.filteredProducts[index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue.shade100),
                    child: ListTile(
                      leading: Image.asset(product.imageUrl),
                      title: Text(product.name),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                      onTap: () {
                        Get.toNamed('/product-details', arguments: product);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
