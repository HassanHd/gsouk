import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/controllers/ControllerAddress.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';
import '../HomeBottomNavBar.dart';
import 'Addnewaddress.dart';
import 'DescriptionAddress.dart';
class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  var radioItem ;
  final ControllerAddress c = Get.put(ControllerAddress());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(HomeBottomNavBar());

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
          text: "Select Address",
          color: primarycolor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),


    body: Container(

      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 80),
          Expanded(
            flex: 70,
            child:Container(
              padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom:10 ),
              // height: MediaQuery.of(context).size.height/1.3,
              child:Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: white,
                  elevation: 5,
                  child:GetBuilder<ControllerAddress>(
                    builder: (controller) => ListView(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount:controller.listDataModel.length,
                          itemBuilder: (BuildContext context, int index) {

                            return RadioListTile(
                              groupValue: radioItem,
                              value:"${ controller.listDataModel[index].governate_id}",
                              activeColor:primarycolor,
                              title: Text(( controller.listDataModel.isEmpty)?"add address":"Ship to a different address ?"),
                              onChanged: (val) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DescriptionAddress(address: '22st', addressId: 5,name:"Home" ,city_name:"Cairo" ,)),
                                );
                                setState(() {
                                  radioItem = val;
                                  print("radioItem----$radioItem");
                                });
                              },

                            );

                          },


                        ),
                        Container(
                          height: 40,
                          child: RadioListTile(
                            groupValue: radioItem,
                            value:"different",
                            activeColor: primarycolor,
                            title: Text("Ship to a different address ?"),
                            onChanged: (val) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Addnewaddress()),
                              );
                              setState(() {
                                radioItem = val;
                                print("radioItem----$radioItem");
                              });
                            },


                          ),
                        ),
                      ],
                    ),

                  )





              ),
            ),
          ),

        ],
      ),
    ),

    );
  }
}
