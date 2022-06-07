import 'dart:developer';

import 'package:bwc_test/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product All'),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot<Object?>>(
          future: controller.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              log("ini apa ${snapshot.data!.docs}");
              var listAllDocs = snapshot.data!.docs;
              return SingleChildScrollView(
                  child: Column(children: [
                Container(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          child: Row(
                            children: [
                              Container(
                                height: 250,
                                width: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.3))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Image.network(
                                        "${(listAllDocs[index].data() as Map<String, dynamic>)['gambar']}",
                                        height: 80,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${(listAllDocs[index].data() as Map<String, dynamic>)['name']}",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                              "\$${(listAllDocs[index].data() as Map<String, dynamic>)['price']}",
                                              style: TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 25, right: 20),
                          child: Row(
                            children: [
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 1.15,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.3))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Image.network(
                                        "${(listAllDocs[index + 2].data() as Map<String, dynamic>)['gambar']}",
                                        height: 80,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${(listAllDocs[index + 2].data() as Map<String, dynamic>)['name']}",
                                          ),
                                          Text(
                                            "\$${(listAllDocs[index + 2].data() as Map<String, dynamic>)['price']}",
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Container(
                                height: 170,
                                width: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.3))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Image.network(
                                        "${(listAllDocs[index + 3].data() as Map<String, dynamic>)['gambar']}",
                                        height: 80,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${(listAllDocs[index + 3].data() as Map<String, dynamic>)['name']}",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                              "\$${(listAllDocs[index + 3].data() as Map<String, dynamic>)['price']}",
                                              style: TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ]));
            }
            return CircularProgressIndicator();
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.toNamed(Routes.PRODUK_NEW),
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
