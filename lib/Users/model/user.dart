import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Places/model/place.dart';

class User1 {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;
  User1(
      {Key? key,
      required this.uid,
      required this.name,
      required this.email,
      required this.photoURL,
      this.myPlaces,
      this.myFavoritePlaces});
}
