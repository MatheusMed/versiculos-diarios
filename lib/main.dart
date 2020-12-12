import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_dia/app/theme/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Versículo Diária",
      initialRoute: AppPages.HOME,
      getPages: AppPages.routes,
      theme: appTheme,
    ),
  );
}
