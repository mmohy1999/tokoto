import 'package:flutter/material.dart';

class Product {
  int id;
  String title, description,store;
  List<String> images;
  List<Color> colors;
  double rating, price;
  bool isFavourite, isPopular,isInCart;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.isInCart = false,
    required this.title,
    required this.price,
    required this.description,
    required this.store
  });
}

