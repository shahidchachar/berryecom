import 'package:ecom_project/presention/auth_screen/login_screen.dart';
import 'package:ecom_project/presention/auth_screen/signup_screen.dart';
import 'package:ecom_project/presention/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecom_project/presention/home_screen/home_screen.dart';

import '../presention/cart_screen/carte_screen.dart';

class DashboardController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController.addListener((){
      int currentPage=pageController.page?.round() ?? 0;
      if(pageIndex.value !=currentPage){
        pageIndex.value=currentPage;
      }});

  }


  var pageIndex=0.obs;
final PageController pageController=PageController();
final List<Widget> screens=[
  HomeScreen(),
  CarteScreen(),
  SignupScreen(),

];
void setPage(int index){
  pageIndex.value=index;
  pageController.jumpToPage(index);
}
}