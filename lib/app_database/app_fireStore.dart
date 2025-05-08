import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_project/models/usermodel.dart';

import '../commo_widget/my_toast.dart';

class AppFirestore {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference userCollectionReference =
  FirebaseFirestore.instance.collection("users");
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static String get getCurrentUserID => firebaseAuth.currentUser!.uid;

  //String get currentUserID => firebaseAuth.currentUser!.uid;

  static Future<void> addUserToDB(
      {required userID,
        required email,
        required firstName,
        required lastName,
        required phoneNumber}) async {
    UserModel userModel = UserModel(
      id: userID,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
    );

    Map<String, dynamic> dataForFirestore = userModel.toJson();

    await userCollectionReference
        .doc(userID)
        .set(dataForFirestore)
        .then((value) {
      showToast(message: "User Added to Firestore");
    }).onError((error, stackTrace) {
      print(
          "Error----------------------------------------------> $error $stackTrace");
      showToast(message: "Error adding user to db!");
    });

  }
}