import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/produk_new_controller.dart';

class ProdukNewView extends GetView<ProdukNewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Produk'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              controller: controller.nameC,
              autocorrect: false,
              decoration: InputDecoration(labelText: "Product Name"),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: controller.priceC,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Price"),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () => controller.addProduct(
                  controller.nameC.text, controller.priceC.text),
              child: Text("Next"),
            ),
          ],
        ));
  }
}
