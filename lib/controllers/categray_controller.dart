import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_project/models/catgrey_model.dart';
import 'package:ecom_project/util/images.dart';
import 'package:get/get.dart';
class CategoryController extends GetxController{
  CollectionReference categoryRef = FirebaseFirestore.instance.collection('Categrey');

  /// Add Multi Categories Entries
  Future<void> uploadCategories(List<CategoryModel> categories) async {

    try {
      for (final category in categories) {

        /// add categories in firestore
        await categoryRef.doc().set(category.toJson());
        // print('Category Uploaded: ${category.name}');

      }

      /// Success
      Get.snackbar('Categories Uploaded', 'All categories uploaded to Firestore');

    } catch (e) {

      /// Error
      Get.snackbar( 'Categories Uploading','Something went wrong. Please try again');

    }
  }

  /// Add Single Category Data
  void addCategoryToFireStore() async {

    String categoryID = categoryRef.doc().id;

    /// Manually assigning data to variable one by one.
    CategoryModel category = CategoryModel(id: categoryID, name: 'Shirt', image: AppImage.shirt);

    /// data variable from category model toJson format
    final data = category.toJson();

    /// Save data to Firestore & success message
    categoryRef.doc(categoryID).set(data).then((value) => Get.snackbar('Success', 'Category Added ${category.name}'));
  }

  /// Fetch Data
  Stream<List<CategoryModel>> loadCategories() {
    return categoryRef.snapshots().map((snapShot) {
      return snapShot.docs.map((doc) {
        return CategoryModel.fromJson(doc);
      }).toList();
    });
  }
}