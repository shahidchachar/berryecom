import 'package:cloud_firestore/cloud_firestore.dart';
class CategoryModel {
  String? _id;
  String? _name;
  String? _image;

  CategoryModel(
      {String? id,
        String? name,
        String? image,

      }) {

    _id = id;
    _name = name;
    _image = image;
  }

  String? get id => _id;
  String? get name => _name;
  String? get image => _image;

  CategoryModel.fromJson(DocumentSnapshot documentSnapshot) {
    _id = documentSnapshot['id'] ?? 0;
    _name = documentSnapshot['name'] ?? '';
    _image = documentSnapshot['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['image'] = _image;
    return data;
  }
}
