import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/const/themeColor.dart';
import './profile.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _toggleVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(45),
              width: 330,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: new AssetImage(
                    'assets/foodtukk1.png',
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Themes.color,
                  borderRadius: BorderRadius.circular(30.0)),
              width: 225.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Sign in With Google',
                          style: TextStyle(color: Colors.black, fontSize: 17.0),
                        ),
                      ],
                    ),
                    onPressed: () {
                      //Implement logic
                 Navigator.of(context).pushNamed('/homepage');
                    }),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 15.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Your Email ",
                        hintStyle: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontSize: 18.0,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _toggleVisibility = !_toggleVisibility;
                            });
                          },
                          icon: _toggleVisibility
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: _toggleVisibility,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
                child: Container(
                  height: 50.0,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Themes.color,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 3, color: Themes.color)
                      ]),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  // implement logic
                   Navigator.of(context).pushReplacementNamed('/homepage');
                }),
            Divider(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
