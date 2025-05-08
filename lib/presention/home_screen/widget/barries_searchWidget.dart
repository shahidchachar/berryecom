import 'package:ecom_project/style/style.dart';
import 'package:ecom_project/util/dimension.dart';
import 'package:flutter/material.dart';
import 'package:ecom_project/util/app_const.dart';
class BarriesSearchwidget extends StatelessWidget {
  const BarriesSearchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimension.fontSizeDefault,vertical: Dimension.paddingSizeSmall),
    alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.only(left: Dimension.paddingSizeSmall),
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset:  Offset(0, 0))
          ],
          borderRadius: BorderRadius.circular(Dimension.paddingSizeExtraSmall )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: TextFormField(
              decoration: InputDecoration(
                hintText:AppConst.searchHintText ,
          hintStyle: popoinRegular.copyWith(color: Theme.of(context).hintColor),
              border:  InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: Dimension.paddingSizeSmall)
        ),
            )),
            Container(
              width: 40,
                height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(Dimension.paddingSizeExtraSmall)
              ),
            ),
    child: Icon(Icons.search,color: Theme.of(context).cardColor,size: Dimension.iconSizeSmall ,),
            )],
        ),
      ),
    
    );
  }
}
