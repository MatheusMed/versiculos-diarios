import 'package:community_material_icon/community_material_icon.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:todo_dia/app/theme/app_theme.dart';
import 'package:todo_dia/app/utils/divider.dart';
import 'package:url_launcher/url_launcher.dart';

class SobreNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 10),
            Center(
              child: Text(
                'Versiculo Diário',
                style: GoogleFonts.poppins(
                  color: txtSobreColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomDivider(),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'Esse aplicativo tem a finalidade de compartilhar versiculos bíblicos diários lhe incentivando a ler a palavra de Deus, bem como,levar a palavra de fé e esperança para a sua vida. ',
                style: GoogleFonts.robotoCondensed(
                    color: txtSobreColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            CustomDivider(),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    color: appTheme.backgroundColor,
                    onPressed: () async {
                      const insta = "https://www.instagram.com/mtheus_mdeiros/";
                      if (await canLaunch(insta)) {
                        await launch(insta);
                      }
                    },
                    child: Icon(
                      CommunityMaterialIcons.instagram,
                      color: appTheme.accentColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Siga-me nas redes social ',
                    style: GoogleFonts.firaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    color: appTheme.backgroundColor,
                    onPressed: () async {
                      const insta =
                          "https://www.instagram.com/igrejabelavistaocara/?hl=pt-br";
                      if (await canLaunch(insta)) {
                        await launch(insta);
                      }
                    },
                    child: Icon(
                      CommunityMaterialIcons.instagram,
                      color: appTheme.accentColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Assembleia de Deus BV',
                    style: GoogleFonts.firaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
