import 'package:todo_dia/app/modules/home/views/home_view.dart';
import 'package:todo_dia/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
