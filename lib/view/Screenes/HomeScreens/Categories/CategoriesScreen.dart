import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/controllers/ControllerCategory.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';
import 'SubCategories.dart';

class CategoriesScreen extends GetWidget<ControllerCategory> {
  final ControllerCategory c = Get.put(ControllerCategory());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerCategory>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // centerTitle: true,
          title: CustomText(
            text: "Categories",
            color: primarycolor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),


        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: BouncingScrollPhysics(),
              itemCount: controller.listDataModel.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  // focusColor: primarycolor,
                  highlightColor: primarycolor,
                  // hoverColor: Colors.red,
                  onTap: ()=> {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => new SubCategoriesScreen( controller.listDataModel[index].id,controller.listDataModel[index].name_en)))
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primarycolor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(25.0)

                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 72,
                          height: 67,
                          // color: Colors.white,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),

                            ),
                            color: Colors.white ,
                          ),
//            decoration: BoxDecoration(
//                shape: BoxShape.circle, color: identifyColor(index)),
                          child: CachedNetworkImage(
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                            imageUrl:
                                "${BaseUrl}image/category/" +
                                    controller.listDataModel[index].image,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          //child: CircleAvatar(
                          //              radius: 48,
                          //              backgroundImage: AssetImage("images/img_${index + 1}.jpg"),
                          //            ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Expanded(
                          child: Text(
                            controller.listDataModel[index].name_en,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                );
                // return ListTile(
                //   title:Text(controller.listDataModel[index].name_ar),
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}
