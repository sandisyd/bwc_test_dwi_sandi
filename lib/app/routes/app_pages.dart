import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/produk_new/bindings/produk_new_binding.dart';
import '../modules/produk_new/views/produk_new_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK_NEW,
      page: () => ProdukNewView(),
      binding: ProdukNewBinding(),
    ),
  ];
}
