import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/controllers/CartController.dart';
import 'package:souk/controllers/helperCart.dart';
import 'package:souk/view/utils/CartItem.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';
import 'AddressScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: CustomText(
          text: "Your Cart",
          color: primarycolor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: FutureBuilder(
        future: HelperCart().getdata(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text("no prodect"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 88,
                          child: AspectRatio(
                            aspectRatio: 0.88,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.network(
                                  "${snapshot.data[index].path_image}"),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${snapshot.data[index].name}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.chevron_left),
                                        onPressed: () {
                                          setState(() {

                                            HelperCart().updateproduct((snapshot.data[index].quantity>1)?snapshot.data[index].quantity-1:snapshot.data[index].quantity=1, snapshot.data[index].product_id);
                                          });

                                        }),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomText(
                                        text: snapshot.data[index].quantity
                                            .toString(),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.chevron_right),
                                        onPressed: () {
                                          setState(() {
                                            HelperCart().updateproduct(snapshot.data[index].quantity+1, snapshot.data[index].product_id);

                                          });

                                        }),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "\$${snapshot.data[index].price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: primarycolor),
                                    children: [
                                      TextSpan(
                                          text:
                                              " x${snapshot.data[index].quantity}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3),
                                IconButton(
                                  onPressed: () {
                                    print("AlertDialog");
                                    FunDialog(snapshot.data[index].product_id);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                  // return CartItem(productId:"${snapshot.data[index].product_id}", price: double.parse(snapshot.data[index].price),name: "${snapshot.data[index].name}",path_image:"${snapshot.data[index].path_image}",quantity:snapshot.data[index].quantity,);
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: primarycolor,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        height: 130,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          children: [


            FutureBuilder(
              future: HelperCart().getQuantiyAndTotal(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 5, right: 5, bottom: 15),
                    child:Container(
                      height: 50,
                      child: Column(
                        children: [

                          Expanded(
                            flex: 40,
                            child: ListTile(
                              title:Text(
                                "Total:",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: textcolor),
                              ),
                              trailing:Text(
                                (snapshot.hasData)?"${snapshot.data[0]["SUM(cast(quantity as DOUBLE)*cast(price as DOUBLE))"]} SAR":" ",
                                // (snapshot.data == null) ? " " : "${snapshot.data["price"]} AED",
                                style: TextStyle(fontSize: 13, color: textcolor),
                              ),
                              dense: true,
                            ),
                          ),
                          Expanded(
                            flex: 40,
                            child: ListTile(

                              title:Text(
                                "Quantity:",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: textcolor),
                              ),
                              trailing:Text(
                                (snapshot.hasData)?"${snapshot.data[0]["SUM(quantity)"]} items":" ",
                                // (snapshot.data == null) ? " " : "${snapshot.data["quantity"]} items",
                                style: TextStyle(fontSize: 13, color: textcolor),
                              ),
                              dense: true,
                            ),
                          )

                        ],
                      ),
                    )

                );

              },

            ),
            DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 10.0,
              dashColor: Colors.grey,
              dashGapLength: 10.0,
              dashGapColor: Colors.transparent,
            ),
            FractionallySizedBox(
              widthFactor: 0.8,

              child: ButtonTheme(
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ), // Sets color for all the descendent ElevatedButtons
                  ),
                  onPressed: ()  {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => new AddressScreen()));
                    HelperCart().fetchCart();
                  },
                  child: Text(
                    "Proceed to Checkout",
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void FunDialog(var id) {
    print("1");
    Get.defaultDialog(
      title: "Are you sure!",
      content: Text('Do you want to remove the cart item?',
      textAlign: TextAlign.center,
      ),
      barrierDismissible: false,
      backgroundColor: Colors.white,

      titleStyle: TextStyle(color: primarydarkcolor),
      middleTextStyle: TextStyle(color: primarydarkcolor),
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () {
        HelperCart().deleteProduct(id).then((value) {
          setState(() {
            Get.back();
            print("done");
          });
        });

      },
      cancelTextColor: Colors.red,
      confirmTextColor: Colors.white,
      buttonColor: primarydarkcolor,

      radius: 15,
    );
    // AlertDialog(
    //   title: Text('Are you sure!'),
    //   content: Text('Do you want to remove the cart item?'),
    //   actions: <Widget>[
    //     FlatButton(child: Text('No'), onPressed: (){
    //     },),
    //     FlatButton(child: Text("Yes"), onPressed: (){
    //       HelperCart().deleteProduct(id).then((value) {
    //         setState(() {
    //           print("delet suc");
    //           // Navigator.of(context).pop(true);
    //         });
    //
    //
    //       });
    //
    //     },)
    //   ],
    // );
  }
}
