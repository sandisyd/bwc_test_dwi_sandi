import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference produk = firestore.collection("product");

    return produk.get();
  }

  final key = "cache_product";
  Future<bool?> saveAllProduct(List<Object?> productAll) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = json.encode(productAll);
    return await sharedPreferences.setString(key, data);
  }

  Future<List<Object>?> getDataAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString(key);
    if (data != null) {
      List<dynamic> dataList = json.decode(data);
      List<Object> productAll = [];
      for (var productData in dataList) {
        productAll.add(productData);
      }
      return productAll;
    }
    return [];
  }
}
