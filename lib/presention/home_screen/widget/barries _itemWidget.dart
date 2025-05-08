import 'package:ecom_project/models/catgrey_model.dart';
import 'package:ecom_project/util/dimension.dart';
import 'package:ecom_project/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_project/style/style.dart';
class BarriesCategriesItemWidget extends StatelessWidget {
  const BarriesCategriesItemWidget({super.key,required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Column(
        children: [
          Container(
            height: Get.width/4.5, 
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                boxShadow:boxShadows,
      borderRadius: BorderRadius.circular(100),
                  ),
            child: Padding(
              padding: const EdgeInsets.all(Dimension.paddingSizeExtraSmall),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(categoryModel.image!,fit: BoxFit.cover,),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(categoryModel.name!,overflow: TextOverflow.ellipsis,
                maxLines: 1,style: popoinRegular.copyWith(fontSize: Dimension.fontSizeSmall),),
            ),
          )
        ],
      ),
    );
  }
}
