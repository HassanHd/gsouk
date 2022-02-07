import 'package:get/get.dart';
import 'package:souk/models/CartdataModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class CartController {
  List<CartData> list_cartmodel=[];

  // CartController( ){
  //   fetchCart().then((value)=>update());
  // }

  Map<String,String> headers={
    'Content-type':'application/json',
    'Accept':'application/json'
  };

  Future<void> fetchCart() async{
    final url=Uri.parse("https://www.elastic-tech.com/cart/5");

    List<CartData> data=[
      CartData(product_id: 7,product_amount: 6),
    ];

     var encodeddata=jsonEncode(data);
    var responce= await http.post(url,body: encodeddata,headers:headers );

    print(jsonDecode(responce.body));
  }
}