import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProdukNewController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String name, String price) async {
    CollectionReference produk = firestore.collection("product");

    try {
      await produk.add({"name": name, "price": price});

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil ditambahkan",
          onConfirm: () {
            nameC.clear();
            priceC.clear();
            Get.back();
            Get.back();
          },
          textConfirm: "Okay");
    } catch (e) {
      log("ini error $e");
      Get.defaultDialog(title: "Gagal", middleText: "Gagal mengambil data");
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
