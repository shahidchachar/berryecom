import 'package:ecom_project/controllers/product_controllers.dart';
import 'package:ecom_project/models/catgrey_model.dart';
import 'package:ecom_project/models/product_model.dart';
import 'package:ecom_project/util/dimension.dart';
import 'package:ecom_project/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_project/style/style.dart';
class BarriesProductItemWidget extends StatelessWidget {
  BarriesProductItemWidget({super.key, required this.productModel});
  final Product productModel;
final ProductController productController=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //product detail
      },
      child:Container(
        height: MediaQuery.sizeOf(context).width/1.5,
        width: MediaQuery.sizeOf(context).width/1.5,
        padding: EdgeInsets.all(Dimension.paddingSizeExtraSmall),
        margin: EdgeInsets.all(Dimension.paddingSizeExtraSmall),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor,
          boxShadow: boxShadows,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).width/2.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                    ),
                    child: Image.asset(productModel.image!),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: Dimension.fontSizeSmall,
                    bottom: 5,left: 5,right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(productModel.name??'No Name'),
                      SizedBox(
                        height: Dimension.paddingSizeSmall,
                      )
                    ],
                  ),
                
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
