import 'package:get/get.dart';

import '../HomePage/CartPage/CartPage.dart';
import '../HomePage/ProductDetailsPage.dart';
import '../HomePage/ProductListPage.dart';

var pagePath = [
  GetPage(
    name: '/',
    page: () => ProductListPage(),
  ),
  GetPage(
    name: '/product-details',
    page: () => ProductDetailsPage(),
  ),
  GetPage(
    name: '/cart',
    page: () => CartPage(),
  ),
];
