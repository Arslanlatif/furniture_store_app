import 'dart:ui';

import 'package:flutter/material.dart';



Widget button(
    {required BuildContext context,
    String? string,
    double? width,
    GestureTapCallback? voidCallback}) {
  Size size = MediaQuery.of(context).size;
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: voidCallback,
        child: Container(
          height: size.width / 8,
          width: size.width / width!,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            string!,
            style: TextStyle(color: Colors.white.withOpacity(.8)),
          ),
        ),
      ),
    ),
  );
}
