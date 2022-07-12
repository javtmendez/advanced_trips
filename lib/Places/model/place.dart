import 'package:flutter/material.dart';

class Place {
  String? id;
  String name;
  String description;
  String urlImage;
  int? likes = 0;
  // User1? userOwner;
  Place({
    Key? key,
    required this.name,
    required this.description,
    required this.urlImage,
    this.likes = 0,
    // this.userOwner
  });
}
