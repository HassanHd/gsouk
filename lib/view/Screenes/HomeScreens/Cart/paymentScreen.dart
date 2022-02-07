import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/view/utils/CustomButton.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';
class paymentScreen extends StatefulWidget {
  const paymentScreen({Key? key}) : super(key: key);

  @override
  _paymentScreenState createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {
  var radioItem ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();

              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: primarycolor,
              ),
            ),
            titleSpacing: 0,

            // centerTitle: true,
            title: CustomText(
              text: "Your order",
              color: primarycolor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
      body:Container(
          padding: EdgeInsets.all(10),
   child: Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
    ),
    color: white,
    elevation: 5,
     child: Padding(
       padding: const EdgeInsets.all(1.0),
       child: ListView(
         children: [
           SizedBox(height: 20),
           Container(
               padding: const EdgeInsets.symmetric(
                   horizontal: 5,vertical: 2.5),
               child: Row(
                 crossAxisAlignment:
                 CrossAxisAlignment.center,
                 mainAxisAlignment:
                 MainAxisAlignment
                     .spaceBetween,
                 children: [
                   Container(
                       child: Text(
                         "250ML" +
                             " ("+"Pack of 30"+")"+"(6)",
                         style: TextStyle(
                             fontSize: 20,
                             fontWeight:
                             FontWeight.w800,
                             color: Colors.black),
                       )),
                   Container(
                       padding:
                       EdgeInsets.symmetric(
                           horizontal: 10),
                       child: Text(
                         "AED 60",
                         style: TextStyle(
                             fontSize: 16,
                             fontWeight:
                             FontWeight.w600,
                             color: textcolor),
                       )),
                 ],
               )),
           Container(
               padding: const EdgeInsets.symmetric(
                   horizontal: 5,vertical: 2.5),
               child: Row(
                 crossAxisAlignment:
                 CrossAxisAlignment.center,
                 mainAxisAlignment:
                 MainAxisAlignment
                     .spaceBetween,
                 children: [
                   Container(
                       child: Text(
                         "250ML" +
                             " ("+"Pack of 30"+")"+"(6)",
                         style: TextStyle(
                             fontSize: 20,
                             fontWeight:
                             FontWeight.w800,
                             color: Colors.black),
                       )),
                   Container(
                       padding:
                       EdgeInsets.symmetric(
                           horizontal: 10),
                       child: Text(
                         "AED 60",
                         style: TextStyle(
                             fontSize: 16,
                             fontWeight:
                             FontWeight.w600,
                             color: textcolor),
                       )),
                 ],
               )),
           Container(
               padding: const EdgeInsets.symmetric(
                   horizontal: 5,vertical: 2.5),
               child: Row(
                 crossAxisAlignment:
                 CrossAxisAlignment.center,
                 mainAxisAlignment:
                 MainAxisAlignment
                     .spaceBetween,
                 children: [
                   Container(
                       child: Text(
                         "250ML" +
                             " ("+"Pack of 30"+")"+"(6)",
                         style: TextStyle(
                             fontSize: 20,
                             fontWeight:
                             FontWeight.w800,
                             color: Colors.black),
                       )),
                   Container(
                       padding:
                       EdgeInsets.symmetric(
                           horizontal: 10),
                       child: Text(
                         "AED 60",
                         style: TextStyle(
                             fontSize: 16,
                             fontWeight:
                             FontWeight.w600,
                             color: textcolor),
                       )),
                 ],
               )),
           Divider(
             color: gray,
             height: 10,
             indent: 70,
             endIndent: 70,
             thickness: 0.7,
           ),
           Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5),
               child: Row(
                 crossAxisAlignment:CrossAxisAlignment.center ,
                 mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                 children: [
                   Container(
                     // alignment: Alignment.center,
                     // width: MediaQuery.of(context).size.height,
                     // padding: EdgeInsets.symmetric(horizontal: 50),
                       child: Text(
                         "Product",
                         style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.w800,
                             color: Colors.black),                                      )),
                   Container(
                     // alignment: Alignment.center,
                     // width: MediaQuery.of(context).size.height,
                       padding: EdgeInsets.symmetric(horizontal: 10),
                       child: Text(
                         "AED 50",
                         style: TextStyle(
                             fontSize: 16, fontWeight: FontWeight.w600,color: textcolor),
                       )),
                 ],
               )
           ),
           Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5),
               child: Row(
                 crossAxisAlignment:CrossAxisAlignment.center ,
                 mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                 children: [
                   Container(
                     // alignment: Alignment.center,
                     // width: MediaQuery.of(context).size.height,
                     // padding: EdgeInsets.symmetric(horizontal: 50),
                       child: Text(
                         "Shipping",
                         style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.w800,
                             color: Colors.black),
                       )),
                   Container(
                     // alignment: Alignment.center,
                     // width: MediaQuery.of(context).size.height,
                       padding: EdgeInsets.symmetric(horizontal: 10),
                       child: Text(
                         "AED 10",
                         style: TextStyle(
                             fontSize: 16, fontWeight: FontWeight.w600,color: textcolor),
                       )),

                 ],
               )
           ),
           Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5),
               child: Row(
                 crossAxisAlignment:CrossAxisAlignment.center ,
                 mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                 children: [
                   Container(
                     // alignment: Alignment.center,
                     // width: MediaQuery.of(context).size.height,
                     // padding: EdgeInsets.symmetric(horizontal: 50),
                       child: Text(
                         "Tax",
                         style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.w800,
                             color: Colors.black),
                       )),
                   Container(
                     // alignment: Alignment.center,
                     // width: MediaQuery.of(context).size.height,
                       padding: EdgeInsets.symmetric(horizontal: 10),
                       child: Text(
                         "AED 12",
                         style: TextStyle(
                             fontSize: 16, fontWeight: FontWeight.w600,color: textcolor),
                       )),
                 ],
               )
           ),
           Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5),
               child: Column(
                 children: [
                   Container(
                       alignment: Alignment.center,
                       width: MediaQuery.of(context).size.height,
                       padding: EdgeInsets.symmetric(horizontal: 50),
                       child: Text(
                         "Total Amount",
                         style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.w800,
                             color: Colors.black),                                      )),
                   Container(
                       alignment: Alignment.center,
                       width: MediaQuery.of(context).size.height,
                       padding: EdgeInsets.symmetric(horizontal: 50),
                       child: Text(
                         "AED 80",
                         style: TextStyle(
                             fontSize: 18, fontWeight: FontWeight.w600,color: primarycolor),
                       )),
                 ],
               )
           ),
           SizedBox(height: 5),
           Container(
             // alignment: Alignment.center,
               width: MediaQuery.of(context).size.height,
               padding: EdgeInsets.symmetric(horizontal: 10),
               child: Text(
                 "text",
                 style: TextStyle(
                     fontSize: 14,
                     color: textcolor),
                 textAlign:TextAlign.center ,


               )),
           SizedBox(height: 5),
           RadioListTile(
             groupValue: radioItem,
             value:"1",
             activeColor: primarycolor,
             title: Row(
               children: [
                 Expanded(
                     flex: 50,
                     child: Text("Cash on Delivery")),
                 Expanded(
                     flex: 50,
                     child: Text("(10 AED collection fees)",style: TextStyle(color: Colors.red,fontSize: 12),)),

               ],
             ),

             onChanged: (val) {
               setState(() {
                 radioItem = val;
                 print("radioItem----$radioItem");
               });
             },

           ),
           RadioListTile(
             groupValue: radioItem,
             value:"2",
             activeColor: primarycolor,
             title:
             Text("Bank Transfer/Money Transfer"),

             onChanged: (val) {
               setState(() {
                 radioItem = val;
                 print("radioItem----$radioItem");
               });
             },

           ),
           RadioListTile(
             groupValue: radioItem,
             value:"3",
             activeColor: primarycolor,
             title: Text("Credit Card"),
             onChanged: (val) {
               setState(() {
                 radioItem = val;
                 print("radioItem----$radioItem");
               });
             },

           ),
           SizedBox(height: 5),
           Container(
               height: 40,
               width: MediaQuery.of(context).size.height,
               padding: EdgeInsets.symmetric(horizontal: 50),
               child: CustomButton(
                 text: "Place Order",
                 color: primarycolor,
                 onPressed: () {
                   // // NavigationService.instance.navigationKey.currentState
                   // //     .pushNamed(
                   // //   "Payment",
                   // // );
                   // if(radioItem=="2"){
                   //   Navigator.push(
                   //     context,
                   //     MaterialPageRoute(
                   //         builder: (context) => BankTransfer(addressId:widget.addressId.toString() ,clientId:widget.clientId.toString() ,)
                   //     ),
                   //   );
                   // }else if(radioItem=="1"){
                   //   addorder("COD");
                   //
                   // }
                   // else if(radioItem=="3"){
                   //   addorder("Visa");
                   // }else{
                   //   _onError("Please choose any payment type.");
                   // }

                 },
               )),
           SizedBox(height: 10),

         ],
       ),
     ),
    )

      ) ,
    );
  }
}
