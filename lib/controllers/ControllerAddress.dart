import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souk/models/Address.dart';
import 'package:souk/models/Category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../constant.dart';
class ControllerAddress extends GetxController{
  List<Address> listDataModel = [];
  ControllerCategory(){
    fetchAddress().then((value) => update());
  }

  Future<void> fetchAddress() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
      var id = prefs.getString("id");

    listDataModel.clear();
    print("object");
    try {
      var url =
      Uri.parse("${BaseUrl}returnaddress/$id");
      print(url);
      final response = await http.get(url);

      print(response.body.toString());
      // If the call to the server was successful, parse the JSON
      var responseBody = jsonDecode(response.body)["address"];
      print(responseBody);
      for (int i = 0; i < responseBody.length; i++) {
        listDataModel.add(Address.fromMap(responseBody[i]));
      }
    } catch (e) {
      Get.snackbar("Souk", "$e");

    }
  }
  @override
  void onInit() {

  }
}