import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
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

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.05,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head \n",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
  id: 5,
  images: [
    "assets/images/phone.png",
  ],
  colors: [
    const Color(0xFF76B041),
    const Color(0xFF6E85B2),
    const Color(0xFFF1E6E6),
    Colors.black,
  ],
  title: "Iphone 15 PROOOOO mAX",
  price: 1200000.50,
  description: description,
  rating: 4.7,
  isFavourite: true,
  isPopular: true,
),
Product(
  id: 6,
  images: [
    "assets/images/shoes.png",
  ],
  colors: [
    const Color(0xFFF6625E),
    const Color(0xFF836DB8),
    const Color(0xFFDECB9C),
    Colors.white,
  ],
  title: "Trae Youung 3 Semi Blue",
  price: 80.00,
  description: description,
  rating: 4.3,
  isFavourite: false,
  isPopular: true,
),
Product(
  id: 7,
  images: [
    "assets/images/vision.png",
  ],
  colors: [
    const Color(0xFF76B041),
    const Color(0xFF6E85B2),
    const Color(0xFFF1E6E6),
    Colors.brown,
  ],
  title: "Apple Vision Pro",
  price: 4500.99,
  description: description,
  rating: 4.5,
  isFavourite: true,
  isPopular: false,
),

];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";