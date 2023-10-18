import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyContainer extends StatelessWidget {
  late double h;
  late double w;
  late Widget c;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: c,
    );
  }

  MyContainer({
    super.key,
    required this.h,
    required this.w,
    required this.c,
  });
}
