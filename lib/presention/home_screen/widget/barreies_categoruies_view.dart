import 'package:ecom_project/presention/home_screen/widget/barries%20_itemWidget.dart';
import 'package:flutter/material.dart';
import 'package:ecom_project/controllers/categray_controller.dart';
import 'package:get/get.dart';
class BarriesCategiesView extends StatelessWidget {
   BarriesCategiesView({super.key});
 final CategoryController categoryController=Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: categoryController.loadCategories(),
        builder: (context,snapshot){
        if(snapshot.data==null){
          return Center(
            child: CircularProgressIndicator(),);
        }
return GridView.builder(
  padding: EdgeInsets.symmetric(horizontal: 10),
    itemCount: snapshot.data!.length,
shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
    childAspectRatio: .65,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10

    ),

    itemBuilder:(context, index){
      return BarriesCategriesItemWidget(categoryModel: snapshot.data![index]);
    });
        }

    );
  }
}
