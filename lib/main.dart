import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopora/screens/categories_screen.dart';
import 'package:shopora/screens/home_screens.dart';
import 'package:shopora/screens/product_screen.dart';
import 'package:shopora/screens/favorite_screen.dart';
import 'package:shopora/screens/profile_screen.dart';
import 'package:shopora/servise/provider/favorit.dart';
import 'package:shopora/utils/constant.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayDotsTextTheme()
            .copyWith(
              titleMedium: GoogleFonts.raleway(
                color: kcolor1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
            .copyWith(
              titleLarge: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
            .copyWith(
              headlineMedium: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
            .copyWith(
              bodyMedium: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
            .copyWith(
              displayMedium: GoogleFonts.cabin(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
            .copyWith(
              titleSmall: GoogleFonts.cabin(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => HomeScreens(),
        ProductScreen.productRoute: (ctx) => ProductScreen(),
        CategoriesScreen.categoryRoute: (ctx) => CategoriesScreen(),
        FavoriteScreen.favoriteRoute: (ctx) => FavoriteScreen(),
        ProfileScreen.profileRoute: (ctx) => ProfileScreen(),
      },
    );
  }
}
