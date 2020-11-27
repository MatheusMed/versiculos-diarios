import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_dia/app/global/widgets/bottom_nav_custom.dart';
import 'package:todo_dia/app/modules/home/controllers/home_controller.dart';
import 'package:todo_dia/app/modules/home/navigation/config_navigation.dart';
import 'package:todo_dia/app/modules/home/navigation/home_navigation.dart';
import 'package:todo_dia/app/modules/home/navigation/sobre_navigation.dart';
import 'package:todo_dia/app/theme/app_theme.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Visibility(
                visible: controller.selectedIndex.value == 0,
                child: Text(
                  'Versiculo Diário',
                  style: GoogleFonts.firaSans(),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.selectedIndex.value == 1,
                child: Text(
                  'Sobre',
                  style: GoogleFonts.firaSans(),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.selectedIndex.value == 2,
                child: Text(
                  'Ajustes',
                  style: GoogleFonts.firaSans(),
                ),
              ),
            ),
          ],
        ),
      ),
      //drawer: CustomDrawer(),
      body: Stack(
        children: [
          Obx(
            () => Visibility(
              visible: controller.selectedIndex.value == 0,
              child: HomeNavigation(),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.selectedIndex.value == 1,
              child: SobreNavigation(),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.selectedIndex.value == 2,
              child: ConfigNavigation(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavCustom(),
    );
  }
}
