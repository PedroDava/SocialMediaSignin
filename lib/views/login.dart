import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(87, 60, 139, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/aJ9dKgc96wvdv50Aedz_G2g5WlSIOznnW9dTyrqxrCTzdgVBEI_F8z4MnPSkdQgc7HNp=s180-rw"),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          /*SizedBox(height: 60),
          Visibility(
            child: signInInformation(),
            visible: !_isVisible,
          ),
          Visibility(
            child: signInMethod(),
            visible: _isVisible,
          ),*/
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
            color: Color.fromRGBO(87, 60, 139, 0.7),
            textColor: Colors.white,
            splashColor: Color.fromRGBO(87, 60, 139, 0.5),
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

  Widget signInMethod() {
    return Column(
      children: [
        SignInButton(
          Buttons.Google,
          text: "Sign in  with  Google",
          onPressed: () {},
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
                text: 'with Email',
                icon: Icons.email,
                iconColor: Colors.blueGrey[700],
                mini: true,
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                backgroundColor: Colors.white,
              ),
              SignInButton(
                Buttons.Facebook,
                mini: true,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.Apple,
                mini: true,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.GitHub,
                mini: true,
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
