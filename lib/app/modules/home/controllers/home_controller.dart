import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_dia/app/global/widgets/navigation_item.dart';
import 'package:todo_dia/app/model/versiculo.dart';
import 'package:todo_dia/app/repository/versiculo_repository.dart';
import 'package:todo_dia/app/theme/app_theme.dart';

class HomeController extends GetxController {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static HomeController get to => Get.find();
  final _versiculoRepository = Get.find<VersiculoRepository>();

  RxList _listPaginada = RxList<Versiculo>();
  RxList<Versiculo> get listPaginada => _listPaginada;

  notifiInit() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation("America/Fortaleza"));
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("splash");
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    this.flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleDayNotification(/*String title, String body*/) async {
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        "id",
        "name",
        "desciption",
        priority: Priority.max,
        importance: Importance.max,
      ),
    );

    await this.flutterLocalNotificationsPlugin.zonedSchedule(
          0,
          "Bom Dia!",
          "Veja seu versiculo Diário!",
          _netxinstacenceofFriday(),
          details,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
        );
  }

  tz.TZDateTime _netxinstacenceofFriday() {
    tz.TZDateTime scheduleDate = _nextInstaceOftenAm();
    while (scheduleDate.weekday != DateTime.friday) {
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }
    return scheduleDate;
  }

  _nextInstaceOftenAm() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 7, 30);
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }
    return scheduleDate;
  }

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
    notifiInit();
    scheduleDayNotification();
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

//chamar notificicaçao
// Future<void> showNotification(String title) async {
//   const AndroidNotificationDetails androidPlataformChannelSpecifcs =
//       AndroidNotificationDetails(
//     'You Channel',
//     'youtube',
//     'channel description',
//     priority: Priority.max,
//     importance: Importance.max,
//   );
//   const NotificationDetails plataformChannelSpecifcs = NotificationDetails(
//     android: androidPlataformChannelSpecifcs,
//   );
//   await this.flutterLocalNotificationsPlugin.show(
//         0,
//         title,
//         'inside notification',
//         plataformChannelSpecifcs,
//       );
// }
