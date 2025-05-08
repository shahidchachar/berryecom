import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_project/models/product_model.dart';
import 'package:ecom_project/util/images.dart';
import 'package:get/get.dart';
class ProductController extends GetxController {
  CollectionReference productRef = FirebaseFirestore.instance.collection(
      'Product');

  void addProduct() {
    String productID = productRef
        .doc()
        .id;
    Product productModel = Product(
        id: productID,
        name: 'The Rolex 2024 collection offers a wide range of prestigious, high-precision timepieces',
        description: 'The Rolex 2024 collection offers a wide range of prestigious',
        image: AppImage.watch,
        quantity: 5,
        price: 800,
        ratting: 4.2,
        reviewCount: 308
    );
    var productData = productModel.toJson();
    productRef.doc(productID).set(productData).then((value) =>
        Get.snackbar('Success', 'product Added'));

  }

  Stream<List<Product>> loadProduct() {
    return productRef.snapshots().map((snapShot) {
      return snapShot.docs.map((doc) {
        return Product.fromJson(doc);
      }).toList();
    });
  }
}