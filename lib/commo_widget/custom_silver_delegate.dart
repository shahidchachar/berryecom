import 'package:flutter/cupertino.dart';

class MySilverDelegate extends  SliverPersistentHeaderDelegate{
  Widget child;
  double height;
  MySilverDelegate({required this.child,required this.height});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return  child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => height;

  @override
  // TODO: implement minExtent
  double get minExtent =>  height;

  @override
  bool shouldRebuild(MySilverDelegate oldDelegate ) {
   return oldDelegate.maxExtent!=height || oldDelegate.minExtent!=height || child!=oldDelegate.child;
  }
  

}