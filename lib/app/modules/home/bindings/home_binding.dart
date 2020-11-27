import 'package:get/get.dart';

import 'package:todo_dia/app/modules/home/controllers/home_controller.dart';
import 'package:todo_dia/app/repository/harura_settings.dart';
import 'package:todo_dia/app/repository/versiculo_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HasuraSettings>(() => HasuraSettings());
    Get.lazyPut<VersiculoRepository>(() => VersiculoRepository());
  }
}
