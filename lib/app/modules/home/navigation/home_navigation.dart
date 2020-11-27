import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

import 'package:todo_dia/app/global/widgets/custom_text.dart';
import 'package:todo_dia/app/model/versiculo.dart';
import 'package:todo_dia/app/modules/home/controllers/home_controller.dart';
import 'package:todo_dia/app/theme/app_theme.dart';

class HomeNavigation extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      body: Container(
        padding: EdgeInsets.all(10),
        child: RefreshIndicator(
          onRefresh: () => controller.refrestList(),
          child: Obx(() => _listView()),
        ),
      ),
    );
  }

//mothod
  _listView() {
    final RenderBox box = Get.context.findRenderObject();
    Orientation orientation = Get.context.orientation;
    double tamanho;

    if (orientation == Orientation.portrait) {
      tamanho = Get.height * 0.2;
    } else {
      tamanho = Get.height * 0.4;
    }

    return ListView.builder(
      itemCount: controller.listPaginada.length,
      itemBuilder: (context, index) {
        Versiculo versiculo = controller.listPaginada[index];
        return GestureDetector(
          onTap: () {
            Get.defaultDialog(
              title: 'Versículo Diário',
              confirm: InkWell(
                onTap: () {
                  Share.share(
                      '${versiculo.referencia}\n ${versiculo.versiculos}',
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Compartilhar',
                      style: TextStyle(color: txtColor),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      CommunityMaterialIcons.share_variant,
                      color: txtColor,
                    ),
                  ],
                ),
              ),
              titleStyle: TextStyle(color: txtColor),
              backgroundColor: appTheme.accentColor,
              content: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    CustomText(
                      text: '${versiculo.referencia}',
                      cor: txtDraweColor,
                      tFont: 18,
                    ),
                    SizedBox(height: 3),
                    Text(
                      '${versiculo.versiculos}',
                      style: TextStyle(
                        fontSize: 25,
                        color: txtColor,
                      ),
                      maxLines: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
            height: tamanho,
            decoration: BoxDecoration(
              color: appTheme.accentColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: '${versiculo.referencia}',
                        cor: txtDraweColor,
                        tFont: 18,
                      ),
                      CustomText(
                        text: '${versiculo.data}',
                        cor: txtDraweColor,
                        tFont: 18,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    '${versiculo.versiculos}',
                    style: GoogleFonts.firaSans(
                      color: txtColor,
                      fontSize: 21.5,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
