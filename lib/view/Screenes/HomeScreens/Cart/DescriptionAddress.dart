import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/view/Screenes/HomeScreens/Cart/paymentScreen.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';


class DescriptionAddress extends StatefulWidget {
  int addressId;
  String address;
  String name;

  String city_name;


  DescriptionAddress({required this.addressId, required this.address, required this.name, required this.city_name,});


  @override
  _DescriptionAddressState createState() => _DescriptionAddressState();
}

class _DescriptionAddressState extends State<DescriptionAddress> {
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
          text: "Your Address",
          color: primarycolor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              padding:
              EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 50),
              width: MediaQuery.of(context).size.width,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10),

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 5,
                          child: Container(
                            child: ListTile(
                              title: Text("${widget.address}"),
                              leading: Icon(
                                Icons.location_on_outlined,
                                color: primarycolor,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 5,
                          child: Container(
                            child: ListTile(
                              title: Text("${widget.name}"),
                              leading: Icon(
                                Icons.person,
                                color: primarycolor,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 5,
                          child: Container(
                            child: ListTile(
                              title: Text("${widget.city_name}"),
                              leading: Icon(
                                Icons.location_city,
                                color: primarycolor,
                              ),
                            ),
                          ),
                        ),


                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            child: ButtonTheme(
                              height: 48,
                              child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  primary: primarycolor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),

                                  ),
                                ),
                                onPressed: () {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              paymentScreen()));

                                },


                                child: Text(
                                  "Proceed to Checkout",
                                  style: TextStyle(
                                      color: Theme.of(context).buttonColor),
                                ),
                              ),
                            ),
                          ),

                        ),

                        SizedBox(height: 10),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
