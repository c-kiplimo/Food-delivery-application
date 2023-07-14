import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Cheese Burger",
    hotel: "Hagwarts Cafe",
    price: 1000.00,
    imgUrl:
        "https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/master/pass/Smashburger-recipe-120219.jpg",
  ),
  FoodItem(
    id: 2,
    title: " Burger",
    hotel: "Nafees Restaurant",
    price: 800.00,
    imgUrl:
        "https://i.kinja-img.com/gawker-media/image/upload/s--l6rS3nZj--/c_scale,f_auto,fl_progressive,q_80,w_800/vcwkkj2ayw6eez1rbwdt.jpg",
  ),
  FoodItem(
    id: 3,
    title: " Pizza ",
    hotel: "Dominos",
    price: 600.00,
    imgUrl:
        "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-1.2.1&w=1000&q=80",
  ),
  FoodItem(
    id: 4,
    title: "Masala Dosa",
    hotel: "Cafe Yolo",
    price: 40.00,
    imgUrl:
        "https://www.vegrecipesofindia.com/wp-content/uploads/2017/11/paper-masala-dosa-0.jpg",
  ),
  FoodItem(
    id: 5,
    title: "Veg Rolls",
    hotel: "ROLLS",
    price: 400.00,
    imgUrl:
        "https://i1.wp.com/vegecravings.com/wp-content/uploads/2016/09/spring-roll-recipe-step-by-step-instructions.jpg?fit=3766%2C3024&ssl=1",
  ),
 
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    required this.id,
    required this.title,
    required this.hotel,
    required this.price,
    required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
