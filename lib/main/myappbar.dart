import 'package:flutter/material.dart';
import 'package:shopora/utils/constant.dart';

AppBar myappbar(BuildContext context, {String? kpageName}) {
  final kn = kpageName ?? kName;

  return AppBar(
    elevation: 0.5,
    shadowColor: Colors.black,
    title: Text(
      "$kn",
      style: Theme.of(
        context,
      ).textTheme.titleMedium!.copyWith(color: Colors.black87),
    ),
  );
}
