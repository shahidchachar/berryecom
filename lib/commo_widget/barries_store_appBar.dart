import 'package:ecom_project/util/dimension.dart';
import 'package:flutter/material.dart';
import 'package:ecom_project/style/style.dart';
import 'package:get/get.dart';
import 'package:ecom_project/util/dimension.dart';
class BarriesStoreAppbar extends StatelessWidget implements PreferredSizeWidget{
  const BarriesStoreAppbar({super.key,required this.tittle,required this.iconButton,required this.buttonOnPressed,this.navigateBack=true});
  final String tittle;
  final IconData iconButton;
  final Function()? buttonOnPressed;
  final bool navigateBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primary_color,
        borderRadius: BorderRadius.circular(Dimension.appbarRaduis)
        
      ),
      child: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingSizeDefault),
        child: Row(
          children: [
            Visibility(
              visible: navigateBack,
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back,color:Colors.white ,)),
            ),
            SizedBox(width: 10,),
            Expanded(child: Text(tittle,style: popoinRegular.copyWith(color: Colors.white,fontSize:Dimension.fontSizeExtraLarge ),
            )
            ),
            IconButton(onPressed: (){
              buttonOnPressed;

            }, icon:Icon(iconButton,color: Colors.white,))
          ],
        ),
      )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Dimension.appBarHeight);
}
