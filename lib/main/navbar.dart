import 'package:flutter/material.dart';
import 'package:shopora/utils/constant.dart';

Drawer navbar(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(color: kcolor1),
          currentAccountPicture: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(50),
            child: Image.asset("images/avatar.jpg"),
          ),
          accountName: Text("Prince Mohamed"),
          accountEmail: Text("princeyt8708@gmail.com"),
        ),
        ...routes.map((r) {
          return ListTile(
            onTap: () {
              if (r['route'] != "/") {
                Navigator.of(context).pushNamed(r['route']);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  r["route"],
                  (route) => false,
                );
              }
            },
            title: Text(
              "${r["title"]}",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            leading: Icon(r["icon"]),
          );
        }).toList(),
      ],
    ),
  );
}
