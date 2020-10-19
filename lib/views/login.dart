import 'dart:async'; // New
import 'dart:convert' show json; // New
import "package:http/http.dart" as http; // New
import 'package:google_sign_in/google_sign_in.dart';
// New

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

// New

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email', 'profile'],
  );
  bool _isVisible = true;
  String name = "", email = "", profilePic = "", gender = "";
  String photoUrl =
      "https://firebasestorage.googleapis.com/v0/b/myplayground-2d31d.appspot.com/o/undraw_flutter_dev_wvqj%20(1).png?alt=media&token=b00d0917-26c1-43fb-b1e3-ad7d709f96ce";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 168, 38, 1),
      body: Column(
        //Centering  widgets
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 75.0,
                backgroundImage: NetworkImage(photoUrl),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 60),
          /*    Visibility(
            child: signInInformation(),
            visible: !_isVisible,
          ),*/
          Visibility(
            child: signInButtons(),
            visible: _isVisible,
          ),
          Visibility(
            child: profileDetails(),
            visible: !_isVisible,
          ),
          SizedBox(height: 60),
          Visibility(
            child: signOutButton(),
            visible: !_isVisible,
          ),
        ],
      ),
    );
  }

  Widget signInInformation() {
    return Container(
      width: 300,
      child: Column(children: [
        Center(
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                ),
                // contentPadding:
                // EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "User Name"),
          ),
        ),
        SizedBox(height: 30),
        Center(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                ),
                // contentPadding:
                // EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Password"),
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: 150,
          child: RaisedButton(
            elevation: 2,
            color: Color.fromRGBO(249, 168, 38, 0.7),
            textColor: Colors.white,
            splashColor: Color.fromRGBO(249, 168, 38, 0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Sign In",
              ),
            ),
            //shape: RoundedRectangleBorder(
            //  borderRadius: BorderRadius.circular(30)),
            onPressed: () {},
          ),
        ),
      ]),
    );
  }

  Widget signOutButton() {
    return Container(
      width: 150,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Text('Sign Out'),
        textColor: Colors.black,
        color: Colors.white,
        onPressed: () {
          _googleSignIn
              .signOut()
              .then((value) => print("Out"))
              .catchError((onError) => print(onError));

          setState(() {
            photoUrl =
                "https://firebasestorage.googleapis.com/v0/b/myplayground-2d31d.appspot.com/o/undraw_flutter_dev_wvqj%20(1).png?alt=media&token=b00d0917-26c1-43fb-b1e3-ad7d709f96ce";
            _isVisible = !_isVisible;
          });
        },
      ),
    );
  }

  Widget signInButtons() {
    return Column(
      children: [
        SignInButton(
          Buttons.Google,
          text: "Sign in  with  Google",
          onPressed: () {
            _googleSignIn.signIn().then((response) {
              setState(() {
                name = response.displayName;
                email = response.email;
                photoUrl = response.photoUrl;
                _isVisible = false;
              });
            }).catchError((onError) => print(onError));
          },
        ),
        SizedBox(height: 20),
        Text(
          "Or",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20),
        Container(
          width: 200,
          child: Row(
            children: [
              SignInButtonBuilder(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                text: 'With Email',
                icon: Icons.email,
                iconColor: Colors.blueGrey[700],
                mini: true,
                onPressed: null,
                backgroundColor: Colors.white,
              ),
              SignInButton(Buttons.Facebook,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  mini: true,
                  onPressed: null),
              SignInButton(
                Buttons.Apple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                mini: true,
                onPressed: null,
              ),
              SignInButton(
                Buttons.GitHub,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                mini: true,
                onPressed: null,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget profileDetails() {
    return Container(
      width: 300,
      child: Column(children: [
        Text(name, style: TextStyle(color: Colors.white, fontSize: 20)),
        Text(email, style: TextStyle(color: Colors.white, fontSize: 18)),
      ]),
    );
  }
}
