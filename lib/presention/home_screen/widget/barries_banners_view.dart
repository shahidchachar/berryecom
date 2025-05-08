import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_project/models/banners_model.dart';
import 'package:ecom_project/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarriesBannersView extends StatefulWidget {
  const BarriesBannersView({super.key});

  @override
  State<BarriesBannersView> createState() => _BarriesBannersViewState();
}

class _BarriesBannersViewState extends State<BarriesBannersView> {
  int currentIndex=0;
  void setCurrentIndex(int index){
    setState(() {
      currentIndex=index;
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    List<BannerModel> banners=[
      BannerModel(id: 0,photo: AppImage.banner1),
      BannerModel(id: 1,photo: AppImage.banner2),
      BannerModel(id: 2,photo: AppImage.banner1),
      BannerModel(id: 3,photo: AppImage.banner2),
      BannerModel(id: 4,photo: AppImage.banner1),
      BannerModel(id: 5,photo: AppImage.banner2)
    ];
    return SizedBox(
      width: Get.width,
      height: Get.width*0.35,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
CarouselSlider.builder(

    itemCount: banners.length,
    options: CarouselOptions(
      viewportFraction: 1,
      autoPlay: true,
      enlargeCenterPage: true,enlargeFactor: 0,
      disableCenter: true,
      onPageChanged: (index,reson){
        setCurrentIndex(index);
      }
    ),
    itemBuilder:(context,index,realIndex) {
return Container(
  margin: EdgeInsets.symmetric(horizontal: 10),
  width: Get.width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.asset(banners[index].photo ??'',fit: BoxFit.cover,),
  ),
);
    },

),
          Positioned(
              bottom: -20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: banners.map((banner){
                  int index=banners.indexOf(banner);
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                    padding: EdgeInsets.all(8.0),
                              height: 8,
                              width: index==currentIndex ? 25:6,
                              decoration: BoxDecoration(
                              color: index==currentIndex ? Theme.of(context).primaryColor:Theme.of(context).hintColor,
                              borderRadius: BorderRadius.circular(100),
                              ),
                    ),
                  );
                  }).toList(),
    )),
        ],
      ),
    );
  }
}
