import 'package:flutter/material.dart';
import 'package:food_delivery/const/themeColor.dart';
import '../loginpage/sigin_page.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Themes.color),
            clipper: getClipper(),
          ),
          Positioned(
            width: 375.0,
            top: MediaQuery.of(context).size.height / 3.5,
            child: Column(
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Themes.color,
                    // image: DecorationImage(
                    //   image: NetworkImage('${this.widget.detailsUser.photoUrl}'),
                    //   fit: BoxFit.cover,
                    // ),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7.2,
                        color: Colors.black,
                        spreadRadius: 0.2,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Hello, world!',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Hello, world!',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 40.0,
                  width: 250.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Themes.color,
                    color: Themes.color,
                    elevation: 7.0,
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 40.0,
                  width: 250.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Themes.color,
                    color: Themes.color,
                    elevation: 7.0,
                    child: Center(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 2.0);
    path.lineTo(size.width + 480, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
