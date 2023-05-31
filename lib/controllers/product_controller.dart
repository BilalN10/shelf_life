import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/models/product_model.dart';
import 'package:shelf_life/models/select_feature_model.dart';
import 'package:shelf_life/models/user_model.dart';

class ProductController extends GetxController {
  AuthController authController = Get.put(AuthController());

  TextEditingController productNameCont = TextEditingController();
  TextEditingController quantityCont = TextEditingController();
  TextEditingController descriptionCont = TextEditingController();
  TextEditingController price_1 = TextEditingController();
  TextEditingController price_2 = TextEditingController();
  TextEditingController price_3 = TextEditingController();
  TextEditingController fixedPrice = TextEditingController();
  TextEditingController eanCode = TextEditingController();

  String foodCategory = '';
  String foodPreferance = '';
  List<SelectFeatureModel> selectedFeature = [];
  String date = '';
  //String eanCode = '';//
  List<String> imageList = [];
  bool isFixedPrice = true;
  RxBool isProductAdd = false.obs;
  Future<void> addProduct(UserModel userModel) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      isProductAdd.value = true;
      Map<String, dynamic> productData = {
        'name': productNameCont.text,
        'quantity': quantityCont.text,
        'description': descriptionCont.text,
        'price_1': price_1.text,
        'price_2': price_2.text,
        'price_3': price_3.text,
        'fix_price': isFixedPrice ? fixedPrice.text : '',
        'date': date,
        'eanCode': eanCode.text,
        'foodCategory': foodCategory,
        'foodPreferance': foodPreferance,
        'email': userModel.email,
        'phone_number': userModel.phoneNumber,
        "user_name": userModel.userName,
        'surname': userModel.surname,
        'alternative_email': userModel.alternativeEmail,
        'profile_pic': userModel.profilePic,
        'user_id': userModel.userId,
        'user_token_id': userModel.tokenId,
        'is_fixedPrice': isFixedPrice,
        'main_image': imageList[0],
        'total_rating': userModel.totalRating,
        'date_time': DateTime.now()
      };
      await FirebaseFirestore.instance
          .collection('products')
          .add(productData)
          .then((value) async {
        for (var imageUrl in imageList) {
          await FirebaseFirestore.instance
              .collection('products')
              .doc(value.id)
              .collection('imageList')
              .add({'image_url': imageUrl});
        }
        for (var feature in selectedFeature) {
          await FirebaseFirestore.instance
              .collection('products')
              .doc(value.id)
              .collection('selected_feature')
              .add({
            'featuer_name': feature.name,
            'featuer_image': feature.image,
          });
        }
      });
      isProductAdd.value = false;
      productNameCont.clear();
      quantityCont.clear();
      descriptionCont.clear();
      price_1.clear();
      price_2.clear();
      price_3.clear();
      fixedPrice.clear();

      Get.back();
    } else {
      isProductAdd.value = false;

      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text('Internet connection not available'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  RxBool isImageAdd = false.obs;
  RxInt imageIndex = 0.obs;
  Future<String> uploadProductImage(File imagefile) async {
    String url = '';
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child(DateTime.now().toString());
    await ref.putFile(imagefile);
    url = await ref.getDownloadURL();
    return url;
  }

  // <<<<============================  get Uploaded product  ==================================>>>>>

  Rx<List<ProductModel>> productList = Rx<List<ProductModel>>([]);
  List<ProductModel> get getproductList => productList.value;

  getAllProduct() {
    productList.bindStream(getProductStream());
  }

  Stream<List<ProductModel>> getProductStream() {
    return FirebaseFirestore.instance
        .collection('products')
        .where('user_id', isEqualTo: authController.getUserData.userId)
        .orderBy('date_time', descending: true)
        .snapshots()
        .map((event) {
      List<ProductModel> retVal = [];
      for (var element in event.docs) {
        retVal.add(ProductModel.fromSnamshot(element));
      }
      return retVal;
    });
  }

  // <<<<============================  get recomended product  ==================================>>>>>

  Rx<List<ProductModel>> recomendedProductList = Rx<List<ProductModel>>([]);
  List<ProductModel> get getrecomendedProductList =>
      recomendedProductList.value;

  getRecomendedProduct() {
    recomendedProductList.bindStream(getecomendedProductStream());
  }

  Stream<List<ProductModel>> getecomendedProductStream() {
    return FirebaseFirestore.instance
        .collection('products')
        .orderBy('date_time', descending: true)
        .snapshots()
        .map((event) {
      List<ProductModel> retVal = [];
      for (var element in event.docs) {
        retVal.add(ProductModel.fromSnamshot(element));
      }
      print('product list is ${retVal.length}');
      return retVal;
    });
  }

  getProductByCategory(String productName) {
    recomendedProductList.bindStream(getProductByCategoryStream(productName));
  }

  Stream<List<ProductModel>> getProductByCategoryStream(String productName) {
    return FirebaseFirestore.instance
        .collection('products')
        .where('foodCategory', isEqualTo: productName)
        .orderBy('date_time', descending: true)
        .snapshots()
        .map((event) {
      List<ProductModel> retVal = [];
      for (var element in event.docs) {
        retVal.add(ProductModel.fromSnamshot(element));
      }
      print('product list is ${retVal.length}');
      return retVal;
    });
  }

  List<String> filterProductName = [];

  double minSalary = 0.0;
  double maxSalary = 0.0;
  RxBool isFilter = false.obs;

  Future getFilterProduct() async {
    isFilter.value = true;
    recomendedProductList.bindStream(filterProduct());
  }

  Stream<List<ProductModel>> filterProduct() {
    return FirebaseFirestore.instance
        .collection('products')
        .where('foodCategory', whereIn: filterProductName)
        .orderBy('date_time', descending: true)
        .snapshots()
        .map((event) {
      List<ProductModel> retVal = [];
      for (var element in event.docs) {
        if (maxSalary != 0 && maxSalary != 0) {
          if (element['is_fixedPrice']) {
            if (double.parse(element['fix_price']) > minSalary &&
                double.parse(element['fix_price']) < maxSalary) {
              retVal.add(ProductModel.fromSnamshot(element));
            }
          } else {
            if (double.parse(element['price_1']) > minSalary &&
                double.parse(element['price_1']) < maxSalary) {
              retVal.add(ProductModel.fromSnamshot(element));
            }
          }
        } else {
          retVal.add(ProductModel.fromSnamshot(element));
        }
      }
      print('filter list is ${retVal.length}');

      return retVal;
    });
  }
}
