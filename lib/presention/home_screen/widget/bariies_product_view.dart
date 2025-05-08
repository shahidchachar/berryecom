import 'package:ecom_project/controllers/product_controllers.dart';
import 'package:ecom_project/presention/home_screen/widget/barries%20_itemWidget.dart';
import 'package:ecom_project/presention/home_screen/widget/barries_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecom_project/controllers/categray_controller.dart';
import 'package:get/get.dart';
class BarriesProductView extends StatelessWidget {
  BarriesProductView({super.key});
  final ProductController productController=Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: productController.loadProduct(),
        builder: (context,snapshot){
          if(snapshot.data==null){
            return Center(
              child: CircularProgressIndicator(),);
          }
          return SizedBox(
            height: MediaQuery.sizeOf(context).width/1.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder:(context, index){
                  return BarriesProductItemWidget(productModel: snapshot.data![index]);
                }),
          );
        }

    );
  }
}
