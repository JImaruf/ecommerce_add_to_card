import 'package:flutter/material.dart';

class ProductDetails {
  final String title;
  final String size;
  final String color;
  final String price;
  final String imagePath;
  final String count;

  ProductDetails({
    required this.title,
    required this.size,
    required this.color,
    required this.price,
    required this.imagePath,
    required this.count,
  });
}

List<ProductDetails> products = [
  ProductDetails(
    title: 'Pullover',
    size: 'L',
    color: 'Black',
    price: '\$51',
    imagePath: 'images/1.png',
    count: '1',
  ),
  ProductDetails(
    title: 'T-Shirt',
    size: 'L',
    color: 'Grey',
    price: '\$30',
    imagePath: 'images/2.png',
    count: '1',
  ),
  ProductDetails(
    title: 'Sports Dress',
    size: 'M',
    color: 'Black',
    price: '\$43',
    imagePath: 'images/3.png',
    count: '1',
  ),
];
