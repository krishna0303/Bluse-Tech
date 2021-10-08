import 'package:bluse/Authentication/authenication.dart';
import 'package:bluse/Widgets/bouncingButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bluse/Admin/adminLogin.dart';
import 'package:bluse/Widgets/customTextField.dart';
import 'package:bluse/DialogBox/errorDialog.dart';
import 'package:bluse/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Store/storehome.dart';
import 'package:bluse/Config/config.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "images/login.png",
                height: 240.0,
                width: 240.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Recover your account",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailTextEditingController,
                    data: Icons.email,
                    hintText: "Email",
                    isObsecure: false,
                  ),
                  // CustomTextField(
                  //   controller: _passwordTextEditingController,
                  //   data: Icons.person,
                  //   hintText: "Password",
                  //   isObsecure: true,
                  // ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                _emailTextEditingController.text.isNotEmpty
                    ? resetPassword()
                    : showDialog(
                        context: context,
                        builder: (c) {
                          return ErrorAlertDialog(
                            message: "This email is not found !",
                          );
                        });
              },
              color: Colors.black,
              child: Text(
                "Reset Password",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 4.0,
              width: _screenWidth * 0.8,
              // color: Colors.pink,
              color: Colors.white,
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void resetPassword() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Password reset link has been sent to your email...",
          );
        });
    FirebaseUser firebaseUser;
    await _auth
        .sendPasswordResetEmail(
      email: _emailTextEditingController.text.trim(),
    )
        .then((authUser) {
      Route route = MaterialPageRoute(builder: (_) => AuthenticScreen());
      // Navigator.pushReplacement(context, route);
      Navigator.pushReplacement(context, route);
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });
  }
}
