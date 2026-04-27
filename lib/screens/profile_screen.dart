import 'package:flutter/material.dart';
import 'package:shopora/main/myappbar.dart';
import 'package:shopora/main/navbar.dart';
import 'package:shopora/utils/constant.dart';
import 'package:shopora/widget/profile/profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  static const profileRoute = "/profile";

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: myappbar(context, kpageName: "Profile"),
      endDrawer: navbar(context),
      body: ProfileBody(size: size),
    );
  }
}

