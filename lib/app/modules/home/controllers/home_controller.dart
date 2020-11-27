import 'package:community_material_icon/community_material_icon.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_dia/app/global/widgets/navigation_item.dart';
import 'package:todo_dia/app/model/versiculo.dart';
import 'package:todo_dia/app/repository/versiculo_repository.dart';
import 'package:todo_dia/app/theme/app_theme.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final _versiculoRepository = Get.find<VersiculoRepository>();

  RxList _listPaginada = RxList<Versiculo>();
  RxList<Versiculo> get listPaginada => _listPaginada;

  Future<void> refrestList() async {
    _versiculoRepository
        .getVersiculosPaginados()
        .then((v) => _listPaginada.assignAll(v))
        .catchError((e) => print('Error $e'));
    Get.snackbar(
      "",
      "",
      titleText: Text(
        'Sucesso',
        style: TextStyle(color: txtColor),
      ),
      messageText: Text(
        'Lista de versiculos atualizadas com sucesso',
        style: TextStyle(color: txtColor),
      ),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      icon: Icon(
        CommunityMaterialIcons.check,
        color: Colors.greenAccent,
      ),
      backgroundColor: appTheme.primaryColorDark,
      mainButton: FlatButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back();
          }
        },
        child: Text(
          'Fechar',
          style: TextStyle(color: txtColor),
        ),
      ),
      colorText: appTheme.unselectedWidgetColor,
    );
  }

  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = txtColor;

  List<NavigationItem> items = [
    NavigationItem(Icon(CommunityMaterialIcons.book_open_page_variant),
        Text('Versiculo'), txtSobreColor),
    NavigationItem(
        Icon(CommunityMaterialIcons.information), Text('Sobre'), txtSobreColor),
    NavigationItem(
        Icon(CommunityMaterialIcons.cogs), Text('Ajustes'), txtSobreColor),
    // NavigationItem(
    //     Icon(Icons.person_outline), Text('Profile'), Colors.cyanAccent),
  ];

  void mudarIndex(int index) => selectedIndex.value = index;

  @override
  void onInit() async {
    _versiculoRepository
        .getVersiculosPaginados()
        .then(_listPaginada.addAll)
        .catchError((e) => print('Error $e'));
    super.onInit();
  }

  @override
  void onReady() {
    Get.snackbar(
      'Atualizar os versiculos',
      'Puxe para baixo para atualizar os versiculos diariamente!',
      backgroundColor: appTheme.accentColor,
      colorText: txtColor,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
    );
    super.onReady();
  }
}

// defaultDialog(
//         title: 'Atualizar os versiculos',
//         titleStyle: TextStyle(color: txtColor),
//         confirm: InkWell(
//           borderRadius: BorderRadius.circular(50),
//           onTap: () {
//             if (Get.isDialogOpen) {
//               Get.back();
//             }
//           },
//           child: Icon(CommunityMaterialIcons.check),
//         ),
//         backgroundColor: appTheme.accentColor,
//         content: Container(
//           child: Text('Atualize os versiculos puxando para baixo',
//               style: TextStyle(color: txtColor)),
//         ));
