import 'package:ecom_project/controllers/dashboard_controller.dart';
import 'package:ecom_project/style/style.dart';
import 'package:ecom_project/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});
  final DashboardController dashboardController=Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Obx(()=> BottomNavigationBar(
          currentIndex: dashboardController.pageIndex.value,
          unselectedItemColor: Colors.grey,
          selectedItemColor: primary_color,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          onTap: (value){
            dashboardController.setPage(value);
          },

            items:[_items(AppImage.menu, 'Home', 0, dashboardController),
                   _items(AppImage.bag, 'Beg', 1, dashboardController),
                  _items(AppImage.cart, 'Cart', 2, dashboardController)
            ]
        ),
      ),
      body: PageView.builder(
          controller: dashboardController.pageController,
          itemCount: dashboardController.screens.length,
          itemBuilder:(context,index) {
    return dashboardController.screens[index];
          }),
    );

  }
}
BottomNavigationBarItem _items(String image,String lable, int index,DashboardController controler){
  return BottomNavigationBarItem(

      icon:Obx(()=> SizedBox(width: 20,
          child: Image.asset(image,color: index==controler.pageIndex.value?primary_color:Colors.grey),
          ),
      ),
          label: lable
  );
}
