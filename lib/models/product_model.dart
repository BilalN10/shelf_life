import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? productName;
  String? quantity;
  String? description;
  String? price_1;
  String? price_2;
  String? price_3;
  String? foodCategory;
  String? fixPrice;
  String? alternativeEmail;
  String? date;
  String? eanCode;
  String? foodPreferance;
  bool? isFixedPrice;
  String? phoneNumber;
  String? surname;
  double? totalRating;
  String? userName;
  String? profilePic;
  String? tokenId;
  String? email;
  String? userId;
  String? productId;
  String? mainImage;

  ProductModel(
      {this.productId,
      this.alternativeEmail,
      this.email,
      this.phoneNumber,
      this.profilePic,
      this.surname,
      this.totalRating,
      this.userId,
      this.date,
      this.description,
      this.eanCode,
      this.fixPrice,
      this.foodCategory,
      this.foodPreferance,
      this.isFixedPrice,
      this.price_1,
      this.price_2,
      this.price_3,
      this.productName,
      this.quantity,
      this.tokenId,
      this.userName,
      this.mainImage});
  ProductModel.fromSnamshot(DocumentSnapshot<Map<String, dynamic>> data) {
    productId = data.id;
    productName = data.data()!["name"];
    description = data.data()!["description"] ?? "";
    quantity = data.data()!["quantity"] ?? "";
    price_1 = data.data()!["price_1"] ?? "";
    price_2 = data.data()!["price_2"] ?? "";
    price_3 = data.data()!["price_3"] ?? "";
    fixPrice = data.data()!["fix_price"] ?? "";

    date = data.data()!["date"] ?? "";
    eanCode = data.data()!["eanCode"];
    foodCategory = data.data()!["foodCategory"] ?? "";
    foodPreferance = data.data()!["foodPreferance"] ?? "";
    isFixedPrice = data.data()!["is_fixedPrice"];
    mainImage = data.data()!["main_image"] ?? "";

    userId = data.data()!["user_id"] ?? "";
    alternativeEmail = data.data()!["alternative_email"];
    email = data.data()!["email"] ?? "";
    tokenId = data.data()!["user_token_id"] ?? "";
    phoneNumber = data.data()!["phone_number"] ?? "";
    profilePic = data.data()!["profile_pic"] ?? "";
    surname = data.data()!["surname"] ?? "";

    totalRating = data.data()!["total_rating"].toDouble();
    userName = data.data()!["user_name"] ?? "";
    print('user email is $email');
  }
}
