import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopora/main/myappbar.dart';
import 'package:shopora/main/navbar.dart';
import 'package:shopora/servise/provider/favorit.dart';
import 'package:shopora/utils/constant.dart';
import 'package:shopora/utils/dialog.dart';
import 'package:shopora/widget/favorite/favorite_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  static const favoriteRoute = "/favorite";

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: myappbar(context, kpageName: "Favorite"),
      endDrawer: navbar(context),
      body: FavoriteBody(size: size),
    );
  }
}
