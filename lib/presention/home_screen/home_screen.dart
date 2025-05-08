import 'package:ecom_project/commo_widget/barries_store_appBar.dart';
import 'package:ecom_project/commo_widget/custom_silver_delegate.dart';
import 'package:ecom_project/controllers/categray_controller.dart';
import 'package:ecom_project/controllers/product_controllers.dart';
import 'package:ecom_project/presention/home_screen/widget/bariies_product_view.dart';
import 'package:ecom_project/presention/home_screen/widget/barreies_categoruies_view.dart';
import 'package:ecom_project/presention/home_screen/widget/barries%20_itemWidget.dart';
import 'package:ecom_project/presention/home_screen/widget/barries_banners_view.dart';
import 'package:ecom_project/style/style.dart';
import 'package:ecom_project/util/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_project/util/app_const.dart';
import 'package:ecom_project/presention/home_screen/widget/barries_searchWidget.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final CategoryController categoryController=Get.put(CategoryController());
  final ProductController productController=Get.put(ProductController());

  @override Widget build(BuildContext context) {
    ScrollController scrollController=ScrollController();
    return Scaffold(
      appBar: BarriesStoreAppbar(tittle:AppConst.appName,
          iconButton:Icons.shopping_bag, buttonOnPressed:(){

        },navigateBack: false,),
body: GestureDetector(
  onTap: (){
    FocusScope.of(context).unfocus();
  },
  child: RefreshIndicator(
    onRefresh: ()async{
      print('Print Data');

    },
    child: CustomScrollView(
      controller: scrollController,
        slivers: [
          SliverPersistentHeader(
floating: true,
              delegate:MySilverDelegate(child: BarriesSearchwidget(), height: Dimension.appBarHeight)
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               BarriesBannersView(),
               Padding(
                   padding:EdgeInsets.only(left: Dimension.paddingSizeDefault,top: Dimension.paddingSizeLarge,bottom: Dimension.fontSizeExtraLarge),
                 child: Text('Category',style: popoinBold,),
               ),
               BarriesCategiesView(),
            Padding(
              padding:EdgeInsets.only(left: Dimension.paddingSizeDefault,top: Dimension.paddingSizeLarge,bottom: Dimension.fontSizeExtraLarge),
              child: Text('Future Products',style: popoinBold,),
            ) ,
                BarriesProductView()

              ],
            ),
          )
        ],
    )
  ),
),
    );
  }
}
