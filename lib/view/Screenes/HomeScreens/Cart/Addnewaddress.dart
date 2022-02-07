import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/view/utils/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../../../../constant.dart';
class Addnewaddress extends StatefulWidget {
  const Addnewaddress({Key? key}) : super(key: key);

  @override
  _AddnewaddressState createState() => _AddnewaddressState();
}

class _AddnewaddressState extends State<Addnewaddress> {
  TextEditingController _addressController = TextEditingController();
  TextEditingController _houseController = TextEditingController();
  var currentPostion;
  var _dropDownValuecity;
  List datacity = [];

  Future<String> fetchcity() async {
    var url = Uri.parse("https://tfaddalshop.com/api/city");

    var response = await http.get(url);
    var responsbody = jsonDecode(response.body)["data"];
    setState(() {
      datacity = responsbody;
    });
    // print(responsbody);
    return "Sucess";
  }
  @override
  void initState() {
    this.fetchcity();
    // TODO: implement initState
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          text: "Add Address",
          color: primarycolor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),

      body: Form(
        key: _formKey,
        child: Container(
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
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _addressController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Address';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: primarycolor,
                                      )),
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 5.0),
                                  hintText: "Address",
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(15.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                  disabledBorder: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
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
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _houseController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.person,
                                        color: primarycolor,
                                      )),
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 5.0),
                                  hintText: "Name",
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(15.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                  disabledBorder: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 5,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 15,
                                    child: Icon(
                                      Icons.location_city,
                                      color: primarycolor,
                                    )),
                                Expanded(
                                  flex: 80,
                                  child: Container(
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 15),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: _dropDownValuecity == null
                                              ? Text(
                                            'City',
                                            style: TextStyle(
                                                color: primarycolor,
                                                fontFamily: 'Cairo',
                                                fontWeight:
                                                FontWeight.w600),
                                          )
                                              : Text(
                                            _dropDownValuecity ??
                                                'defaultCity',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Cairo',
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          isExpanded: true,
                                          iconSize: 30.0,
                                          style:
                                          TextStyle(color: Colors.black87),
                                          items: datacity.map(
                                                (val) {
                                              return DropdownMenuItem<String>(
                                                value: val['id'].toString(),
                                                child: Text(
                                                  val['city_name'] ?? 'default',
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                  ),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (newVal) {
                                            setState(
                                                  () {
                                                _dropDownValuecity =
                                                newVal as String?;
                                                print(datacity);
                                                // var data = [{'id': 1, 'descripcion': 'Asier'}, {'id': 2, 'descripcion': 'Pepe'}];
                                                // var estateSelected = data.firstWhere((dropdown) => dropdown['id'] == 1);
                                                // print(estateSelected);

                                                print(
                                                    "_dropDownValuecity------>" +
                                                        _dropDownValuecity!);
                                              },
                                            );
                                          },
                                          value: _dropDownValuecity,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();

                                      // Api.addaddresslogined(city: '$_dropDownValuecity', area: '$idarea', name: _houseController.text.toString(), address: _addressController.text.toString()).then((value) {
                                      //   if(value!="false"){
                                      //     Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //             builder: (context) =>
                                      //                 PaymentScreen(double.parse(fee),value,_addressController.text.toString())));
                                      //   }
                                      //
                                      // });
                                      // var chack=Api.SignUp(email,fname!+" "+lname!, password, c_password,phone);
                                      // model.signup(_request, _onSignUp, _onError);
                                      // print(chack);

                                    }

                                  },
                                  child: Text(
                                    "Proceed to Checkout",
                                    style: TextStyle(
                                        color: Theme.of(context).buttonColor),
                                  ),
                                ),
                              ),
                            ),
                            // child: CustomButton(
                            //   text: "Next",
                            //   color: primarycolor,
                            //   onPressed: () {
                            //     print(_phoneController.text);
                            //
                            //     if (_formKey.currentState!.validate()) {
                            //       print(_phoneController.text);
                            //       // getaddress(_phoneController.text);
                            //     }
                            //   },
                            // )
                          ),
                          // Container(
                          //     height: 40,
                          //     width: MediaQuery.of(context).size.height,
                          //     padding: EdgeInsets.symmetric(horizontal: 50),
                          //     child: CustomButton(
                          //       text: "Proceed to Checkout",
                          //       color: primarycolor,
                          //       onPressed: () {
                          //         if (_formKey.currentState!.validate()) {
                          //           // addacount( area:,String address,String house,String city,String name,String email,String mobile);
                          //           // addacount(
                          //           //     area: _dropDownValuearea,
                          //           //     house: _houseController.text,
                          //           //     city: _dropDownValuecity,
                          //           //     name: _nameController.text,
                          //           //     email: _emailController.text,
                          //           //     mobile: widget.mobile,
                          //           //     address: _addressController.text);
                          //         }
                          //       },
                          //     )),
                          SizedBox(height: 10),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
