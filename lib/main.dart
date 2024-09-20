import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monkhub/Config/PagePath.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyMart',
      initialRoute: '/',
      getPages: pagePath,
    );
  }
}
