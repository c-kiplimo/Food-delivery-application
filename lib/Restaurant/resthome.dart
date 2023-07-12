import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/const/themeColor.dart';
import '../services/crud.dart';

class RestaurantHome extends StatefulWidget {
  @override
  _RestaurantHomeState createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  late String restaurantName;
  late String foodName;
  late String amount;
  late String restaurantEmail;
  late String imageUrl;

  @override
  Widget build(BuildContext context) {
    crudMethods crudObj = new crudMethods();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 70.0),
              Container(
                color: Colors.white10,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AddDetails',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.url,
                    style:
                        TextStyle(fontFamily: 'Raleway', color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Image Url",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      this.imageUrl = value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                // this SizedBox fixes the RenderBox error
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 25,
                    style:
                        TextStyle(fontFamily: 'Raleway', color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Restaurant Name",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      this.restaurantName = value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 15,
                    style:
                        TextStyle(fontFamily: 'Raleway', color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Food Name",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      this.foodName = value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    style:
                        TextStyle(fontFamily: 'Raleway', color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Amount",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      this.amount = value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        child: Material(
                          color: Themes.color,
                          borderRadius: BorderRadius.circular(20.5),
                          child: InkWell(
                            onTap: () {
                              Map<String, dynamic> restaurantData = {
                                'restaurantName': this.restaurantName,
                                'foodName': this.foodName,
                                'amount': this.amount,
                                'imageUrl': this.imageUrl,
                              };
                              crudObj.addData(restaurantData).then((result) {
                                dialogTrigger(context);
                              }).catchError((e) {
                                print(e);
                              });
                            },
                            child: Container(
                              height: 45.0,
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 200,),
           Align(
  alignment: Alignment.bottomCenter,
  child: GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
      FirebaseAuth.instance.signOut().then((value) {
        Navigator.of(context).pushReplacementNamed('/firstpage');
      }).catchError((e) {
        print(e);
      });
    },
    child: Text(
      'LogOut',
      style: TextStyle(color: Color.fromARGB(255, 238, 6, 6), fontSize: 18.0),
    ),
  ),
)

            ],
          ),
        ),
      ),
    );
  }

  Future<Future> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Job done', style: TextStyle(fontSize: 22.0)),
            content: Text(
              'Added Successfully',
              style: TextStyle(fontSize: 20.0),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Alright',
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Themes.color),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
