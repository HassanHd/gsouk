import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../constant.dart';
class ProductDisControler{
   static fetchoproductDis(String id) async {
    print("object");

      var url =
      Uri.parse("${BaseUrl}eco/product/$id");
      print(url);
      final response = await http.get(url);

      print(response.body.toString());
      // If the call to the server was successful, parse the JSON
      var responseBody = jsonDecode(response.body)["product"];
      print(responseBody);
      return responseBody;

  }
}