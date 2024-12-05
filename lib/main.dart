import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'route/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.PHOTOS, // Harus sesuai dengan nama rute
      getPages: AppPages.routes, // Harus mengacu pada daftar rute
    );
  }
}
