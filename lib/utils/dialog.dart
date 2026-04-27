
  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog DialogAlert(Icon ic, BuildContext context, String title, String desc, void Function() btnCancelOnPress, void Function() btnOkOnPress) {
    return AwesomeDialog(
                customHeader: ic,
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                title: title,
                desc: desc,
                btnCancelOnPress: btnCancelOnPress,
                btnOkOnPress: btnOkOnPress,
                buttonsTextStyle: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white),
              )..show();
  }