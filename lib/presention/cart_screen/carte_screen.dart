import 'package:ecom_project/commo_widget/barries_store_appBar.dart';
import 'package:flutter/material.dart';
class CarteScreen extends StatelessWidget {
  const CarteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarriesStoreAppbar(tittle: 'Berries Cart',buttonOnPressed:null, iconButton:Icons.nat),
    body: Text('Hi'),
    );
  }
}
