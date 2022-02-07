import 'package:path_provider/path_provider.dart';
import 'package:souk/models/CartModel.dart';
import 'package:souk/models/CartdataModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class HelperCart{
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }
  initialDB() async {
    io.Directory docDirect = await getApplicationDocumentsDirectory();
    String path = join(docDirect.path, ".db");
    var mydb = await openDatabase(path, version: 11, onCreate: _onCreate);
    return mydb;
  }
  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,product_id	varchar NOT NULL UNIQUE,quantity int NOT NULL,path_image TEXT NOT NULL,price varchar NOT NULL,name varchar NOT NULL)');
    print("cart Table Created");
  }

  Future<int> insertdb(Map<String, dynamic> dats) async {
    Database? db_clint = await db;
    var reselt = await db_clint!.insert("cart", dats);
    return reselt;
  }

  // chack(String product_id)async{
  //   Database? db_clint = await db;
  //   var reselt = await db_clint!.rawUpdate('SELECT product_id From');
  // }

  Future<int> deleteProduct(String product_id) async {
    Database? db_clint = await db;
    var reselt = await db_clint!.rawUpdate('DELETE FROM cart WHERE product_id="$product_id"');
    return reselt;
  }

  Future<int> deleteAllProduct() async {
    Database? db_clint = await db;
    var reselt = await db_clint!.rawUpdate('DELETE FROM cart');
    return reselt;
  }
  Future<int> updateproduct(int quantity , String product_id) async {
    Database? db_clint = await db;
    var reselt =
    await db_clint!.rawUpdate('UPDATE cart SET quantity="$quantity"WHERE product_id="$product_id"');
    return reselt;
  }

  Future <List<cartModel>>getdata() async{
    Database? db_Clint=await db;
    List<cartModel>list=[];
    var reselt=await db_Clint!.query("cart");
    print(reselt);
    for(var i in reselt){
      cartModel model=cartModel(product_id: i["product_id"],quantity:i["quantity"],name:i["name"],path_image:i["path_image"] ,price: i["price"]  );
      list.add(model);
    }
    return list;
  }


  Future<List> getSingelRow(int product_id) async {
    Database? db_clint = await db;
    var reselt = await db_clint!.query('cart', where: 'product_id="$product_id"');

    return reselt;
  }


getQuantiyAndTotal()async{
  print("getQuantiyAndTotal");

  Database? db_clint = await db;
  var reseltAll_quantity = await db_clint!.rawQuery("SELECT SUM(quantity),SUM(cast(quantity as DOUBLE)*cast(price as DOUBLE)) FROM cart");
  print("hi>>>>>> $reseltAll_quantity");
  return reseltAll_quantity;

}
//cartadd
  List<CartData> list_cartmodel=[];



  Map<String,String> headers={
    'Content-type':'application/json',
    'Accept':'application/json'
  };

  Future<void> fetchCart() async{
    final url=Uri.parse("https://www.elastic-tech.com/cart/5");

    // List<CartData> data=[
    //   CartData(product_id: 7,product_amount: 6),
    // ];
    Database? db_Clint=await db;
    List<CartData>data=[];
    var reselt=await db_Clint!.query("cart");
    print(reselt);
    for(var i in reselt){
      CartData model=CartData(product_id: i["product_id"],product_amount:i["quantity"],);
      data.add(model);
    }
    var encodeddata=jsonEncode(data);
    var responce= await http.post(url,body: encodeddata,headers:headers );

    print(jsonDecode(responce.body));
  }

}