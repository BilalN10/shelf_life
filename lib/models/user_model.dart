import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? alternativeEmail;
  String? email;
  String? userId;
  String? phoneNumber;
  String? surname;
  double? totalRating;
  String? userName;
  String? profilePic;
  String? tokenId;

  UserModel(
      {this.alternativeEmail,
      this.email,
      this.phoneNumber,
      this.profilePic,
      this.surname,
      this.totalRating,
      this.userId,
      this.tokenId,
      this.userName});
  UserModel.fromSnamshot(DocumentSnapshot<Map<String, dynamic>> data) {
    userId = data.id;
    alternativeEmail = data.data()!["alternative_email"];
    email = data.data()!["email"] ?? "";

    phoneNumber = data.data()!["phone_number"] ?? "";
    profilePic = data.data()!["profile_pic"] ?? "";
    surname = data.data()!["surname"] ?? "";

    totalRating = data.data()!["total_rating"].toDouble();
    userName = data.data()!["user_name"] ?? "";
    tokenId = data.data()!['token_id'] ?? '';
    print('user email is $email');
  }
}
