import 'package:flutter/material.dart';
import 'package:shopora/screens/categories_screen.dart';
import 'package:shopora/screens/favorite_screen.dart';
import 'package:shopora/screens/profile_screen.dart';

const kcolor1 = Color.fromARGB(255, 96, 72, 28);
const kcolor2 = Color(0xFF26A69A);
const kcolor3 = Color(0xFFD4D4D4);

const kName = "Shopora";

const List routes = [
  {"route": "/", "title": "Home", "icon": Icons.home},
  {
    "route": CategoriesScreen.categoryRoute,
    "title": "Categories",
    "icon": Icons.grid_view,
  },
  {"route": "/cart", "title": "Cart", "icon": Icons.shopping_cart},
  {
    "route": FavoriteScreen.favoriteRoute,
    "title": "Favorites",
    "icon": Icons.favorite,
  },
  {
    "route": ProfileScreen.profileRoute,
    "title": "Profile",
    "icon": Icons.person,
  },
];
