import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shelf_life/models/product_model.dart';
import 'package:shelf_life/models/user_model.dart';

class SellerController extends GetxController {
  // <<<<============================ get seller information ==================================>>>>>

  Rx<UserModel> sellerData = UserModel().obs;

  UserModel get getSeller => sellerData.value;
  set getSeller(UserModel value) => sellerData.value = value;

  Future getSellerData(String userId) async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get();
      sellerData.value = UserModel.fromSnamshot(doc);
    } catch (e) {
      print('error is ${e.toString()}');
    }
  }

  // <<<<============================  get Seller product  ==================================>>>>>

  Rx<List<ProductModel>> productList = Rx<List<ProductModel>>([]);
  List<ProductModel> get getproductList => productList.value;

  getAllProduct(String userId) {
    productList.bindStream(getProductStream(userId));
  }

  Stream<List<ProductModel>> getProductStream(String userId) {
    return FirebaseFirestore.instance
        .collection('products')
        .where('user_id', isEqualTo: userId)
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
}
