import 'package:get/get.dart';

import '../controllers/produk_new_controller.dart';

class ProdukNewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdukNewController>(
      () => ProdukNewController(),
    );
  }
}
