import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_dia/app/modules/home/controllers/home_controller.dart';
import 'package:todo_dia/app/theme/app_theme.dart';

class ConfigNavigation extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      body: Container(
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
