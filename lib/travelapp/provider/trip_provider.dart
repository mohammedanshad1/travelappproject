import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:travelapp/travelapp/model/tripmodel.dart';

final List<String> images = [
  "assets/bangkok.jpg",
  "assets/vietnam.jpg",
  "assets/indonesia.jpg",
  "assets/china.jpg",
  "assets/turkey.jpg",
  "assets/latvia.jpg",
  "assets/india.jpg",
  "assets/amsterdam.jpg",
  "assets/germany.jpg",
  "assets/istanbul.jpg"
];

final List<Trip> data = List.generate(
    images.length,
    (index) => Trip(
          image: images[index],
        ));

class TripProvider with ChangeNotifier {
  final List<Trip> tripHome = data;

  List<Trip> get trips => tripHome;

  final List<Trip> wishlist = [];

  List<Trip> get wishtrip => wishlist;

  void addToList(Trip trip) {
    if (!wishlist.contains(trip)) {
      wishlist.add(trip);
      notifyListeners();
    }
  }

  void removeFromList(Trip trip) {
    wishlist.remove(trip);
    notifyListeners();
  }
}
