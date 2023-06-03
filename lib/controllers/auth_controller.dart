import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shelf_life/models/food_prefrence_model.dart';
import 'package:shelf_life/models/user_model.dart';
import 'package:shelf_life/views/pages/authentication/login_page.dart';
import 'package:shelf_life/views/pages/bottom_nav/bottom_nav_page.dart';
import 'package:shelf_life/views/pages/complete_profile/complete_profile_page.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    firebaseUser.bindStream(auth.authStateChanges());

    log('on in it call');

    super.onInit();
  }

  // one signal configuartion
  void configOneSignel() {
    print("onedignal congigured");
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("87202c42-e729-4747-a8c2-3c4859626494");
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {});
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult event) {});
    OneSignal.shared
        .setPermissionObserver((OSPermissionStateChanges changes) {});
    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {});
    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges emailChanges) {});
    //OneSignal.shared.
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final firebaseUser = Rxn<User>();
  User get users => firebaseUser.value!;

  // <<<<============================  create account  ==================================>>>>>

  //sign up controller

  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController reEnterPasswordCont = TextEditingController();
// Profile Controller
  TextEditingController userNameCont = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController surnameCont = TextEditingController();
  TextEditingController alrerNativeEmail = TextEditingController();

  RxBool isSignUp = false.obs;
  Future<void> storeSignUp() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      isSignUp.value = true;
      auth
          .createUserWithEmailAndPassword(
              email: emailCont.text.trim(), password: passwordCont.text.trim())
          .then((value) async {
        var status = await OneSignal.shared.getDeviceState();
        String tokenID = status!.userId!;
        Map<String, dynamic> userData = {
          'email': emailCont.text,
          'phone_number': phoneNumber.text,
          "user_name": '',
          'surname': '',
          'alternative_email': '',
          'profile_pic': '',
          'total_rating': 0,
          'date_time': DateTime.now(),
          'token_id': tokenID
        };
        await firestore
            .collection('users')
            .doc(value.user!.uid)
            .set(userData)
            .then((value) {
          isSignUp.value = false;
          Get.to(() => CompleteProfilePage(
                isDirectToFoodPreferance: false,
              ));
        });

        //Get.back();
        clearSignUpCont();
        // addUserData(value.user!.uid).then((value) {

        // }).catchError((e) {
        //   isSignUp.value = false;
        //   ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        //     content: Text(e.toString()),
        //     behavior: SnackBarBehavior.floating,
        //   ));
        // });
      }).catchError((e) {
        isSignUp.value = false;
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text(e.toString()),
          behavior: SnackBarBehavior.floating,
        ));
      });
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text('Internet connection not available'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  clearSignUpCont() {}

  // <<<<============================  Store User data  ==================================>>>>>

  List<FoodPrefrenceModel> preferanceFoodList = [];
  RxBool isDataAdded = false.obs;
  Future<void> addUserData(File imagefile) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      isDataAdded = true.obs;

      final ref = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child(DateTime.now().toString());
      await ref.putFile(imagefile);
      final url = await ref.getDownloadURL();

      Map<String, dynamic> userData = {
        "user_name": userNameCont.text,
        'surname': surnameCont.text,
        'alternative_email': alrerNativeEmail.text,
        'profile_pic': url,
        'date_time': DateTime.now(),
      };

      FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update(userData)
          .then((value) {
        isDataAdded = false.obs;

        log('data addes');
      }).catchError((e) {
        isDataAdded = false.obs;
      });
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text('Internet connection not available'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  // <<<<============================  Add preferences food  ==================================>>>>>
  RxBool isPreferencesFoodAdded = false.obs;

  Future<void> addPreferencesFood() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      isPreferencesFoodAdded.value = true;

      for (var data in preferanceFoodList) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .collection('preferances_food')
            .add({'food_image': data.image, 'food_name': data.name});
      }
      isPreferencesFoodAdded.value = false;
      Get.offAll(() => const BottomNavPage());
    } else {
      isPreferencesFoodAdded.value = false;

      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text('Internet connection not available'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  // <<<<============================ store login  account ==================================>>>>>
  //sign in Controller
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  RxBool isLogin = false.obs;
  Future<void> login() async {
    isLogin.value = true;
    auth
        .signInWithEmailAndPassword(
            email: loginEmail.text.trim(), password: loginPassword.text.trim())
        .then((value) {
      isLogin.value = false;
      Get.offAll(() => const BottomNavPage());
    }).catchError((e) {
      isLogin.value = false;
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text(e.toString()),
        behavior: SnackBarBehavior.floating,
      ));
    });
  }

  clearSignInController() {
    loginEmail.clear();
    loginPassword.clear();
  }

  // <<<<============================ get User information ==================================>>>>>

  Rx<UserModel> userData = UserModel().obs;

  UserModel get getUserData => userData.value;
  set getUserData(UserModel value) => userData.value = value;

  Future getUser() async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(auth.currentUser?.uid)
          .get();
      userData.value = UserModel.fromSnamshot(doc);
    } catch (e) {
      print('error is ${e.toString()}');
    }
  }

  // <<<<============================ signOut account ==================================>>>>>
  void signOut() async {
    log('Sign out');
    await auth.signOut().then((value) {
      googleSignIn.signOut();
      Get.offAll(() => const LoginPage());
    });
  }
  // <<<<============================ Update profile ==================================>>>>>

  RxBool isProfileUpdate = false.obs;
  updateProfile(
      {required String userName,
      required String surName,
      required String email,
      required String phone,
      File? file}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      isProfileUpdate.value = true;

      Map<String, String>? userData;
      if (file != null) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(DateTime.now().toString());
        await ref.putFile(file);
        final url = await ref.getDownloadURL();
        userData = {
          "user_name": userName,
          'surname': surName,
          'alternative_email': email,
          'phone_number': phone,
          'profile_pic': url,
        };
      } else {
        userData = {
          "user_name": userName,
          'surname': surName,
          'alternative_email': email,
          'phone_number': phone,
        };
      }

      firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update(userData)
          .then((value) {
        getUser();
        Get.back();
        Get.back();
        isProfileUpdate.value = false;
        print('profile update');
      }).catchError((e) {
        isProfileUpdate.value = false;
      });
    } else {
      isProfileUpdate.value = false;

      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text('Internet connection not available'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  // <<<<============================ Google sign in ==================================>>>>>
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  RxBool isGoogleSignin = false.obs;

  Future<void> googleSignIN() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      try {
        isGoogleSignin.value = true;

        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        final UserCredential authResult =
            await auth.signInWithCredential(credential);

        if (authResult.additionalUserInfo!.isNewUser) {
          var status = await OneSignal.shared.getDeviceState();
          String tokenID = status!.userId!;

          Map<String, dynamic> userData = {
            'email': authResult.user!.email!,
            'phone_number': "",
            "user_name": authResult.user!.displayName,
            'surname': authResult.user!.displayName,
            'alternative_email': authResult.user!.email!,
            'profile_pic': authResult.user!.photoURL,
            'total_rating': 0,
            'date_time': DateTime.now(),
            'token_id': tokenID
          };

          await firestore
              .collection('users')
              .doc(auth.currentUser!.uid)
              .set(userData)
              .then((value) {
            isGoogleSignin.value = false;

            Get.to(() => CompleteProfilePage(
                  isDirectToFoodPreferance: true,
                ));
          });
        } else {
          isGoogleSignin.value = false;

          Get.offAll(() => const BottomNavPage());
        }
      } catch (e) {
        isGoogleSignin.value = false;

        print(e);
      }
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text('Internet connection not available'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
