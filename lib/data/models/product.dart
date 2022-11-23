import 'package:flutter/material.dart';

class Product {
  int id;
  String title, description;
  List<String> images;
  List<Color> colors;
  double rating, price;
  bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

