import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_planner/firebase_utills.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../otp_screen/otp_screen.dart';
import '../utilities.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  String? email;
  String get getEmail => email!;
  String? _password;
  String get getPassword => _password!;
  String? _name;
  String get getName => _name!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // void checkSign() async {
  //   final SharedPreferences s = await SharedPreferences.getInstance();
  //   _isSignedIn = s.getBool("is_signedIn") ?? false;
  //   notifyListeners();
  // }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedIn", true);
    _isSignedIn = true;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber, String eMail,
      String password, String name) async {
    email = eMail;
    _password = password;
    _name = name;
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(verificationId: verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  Future signUp(String email, String password, BuildContext context) async {
    try {
      print("sign up called............................");
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String userId = credential.user!.uid;
      print("user id:................................ $userId");

      FirebaseFirestore.instance.collection('users').doc(userId);
      if (context.mounted) {}
    } on FirebaseAuthException catch (e) {
      String? message;
      switch (e.code) {
        case "email-already-in-use":
          message = "This email is already in use";
          break;
        case "invalid-email":
          message = "The email you entered is invalid";
          break;
        case "weak-password":
          message = "The password you entered in too week";
          break;
        case "operation-not-allowed":
          message = "This operation is not allowed";
          break;
      }
      if (context.mounted) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Sign up failed"),
                  content: Text(message!),
                ));
      }
    }
  }

  // verify otp
  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      print("password: $_password      email: $email");
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);

      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;

      if (user != null) {
        _uid = user.uid;
        await signUp(email!, _password!, context);
        await addData(_name!);
        await signOut();

        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
}
