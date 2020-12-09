import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

import 'package:todo_dia/app/global/widgets/custom_text.dart';
import 'package:todo_dia/app/model/versiculo.dart';
import 'package:todo_dia/app/modules/home/controllers/home_controller.dart';
import 'package:todo_dia/app/theme/app_theme.dart';
import 'package:todo_dia/app/utils/divider.dart';

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

    if (controller.listPaginada.isEmpty) {
      return Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Carregando os Versiculos Por Favor Aguarde',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: appTheme.accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: controller.listPaginada.length,
      itemBuilder: (context, index) {
        Versiculo versiculo = controller.listPaginada[index];
        // Palavra palavra = controller.listPalavraPaginada[index];
        return GestureDetector(
          onTap: () {
            Get.defaultDialog(
              title: 'Versículo Diário',
              confirm: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.transparent,
                    onPressed: () {
                      Share.share(
                          '${versiculo.referencia} \n${versiculo.versiculos} \nObrigado Por usar o Versiculo Diário!',
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size);
                    },
                    child: Icon(CommunityMaterialIcons.share_all_outline,
                        color: Colors.white),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    color: Colors.transparent,
                    onPressed: () {
                      Get.dialog(SafeArea(
                        child: Scaffold(
                          appBar: AppBar(
                            title: Text(
                                '${controller.listPalavraPaginada[index].titulo}'),
                            centerTitle: true,
                          ),
                          body: Container(
                            padding: EdgeInsets.all(10),
                            child: ListView(
                              children: [
                                Text(
                                  '${versiculo.versiculos}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: appTheme.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${versiculo.referencia}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: appTheme.accentColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ]),
                                CustomDivider(),
                                Column(children: [
                                  Text(
                                    '${controller.listPalavraPaginada[index].palavras}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      color: appTheme.accentColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                                CustomDivider(),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Autor: ${controller.listPalavraPaginada[index].autor}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: appTheme.accentColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ])
                              ],
                            ),
                          ),
                        ),
                      ));
                    },
                    child: Row(
                      children: [
                        Text(
                          'Palavra',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.arrow_forward,
                          color: txtColor,
                        ),
                      ],
                    ),
                  ),
                ],
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
                    SizedBox(height: 5),
                    Text(
                      '${versiculo.versiculos}',
                      style: GoogleFonts.robotoCondensed(
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
                    style: GoogleFonts.robotoCondensed(
                      color: txtColor,
                      fontSize: 20.5,
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
