import 'package:flutter/material.dart';
import 'package:shopora/main/myappbar.dart';
import 'package:shopora/main/navbar.dart';
import 'package:shopora/utils/constant.dart';
import 'package:shopora/widget/home/home_body.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(context, kpageName: kName),
      endDrawer: navbar(context),
      body: HomeBody(),
    );
  }
}
