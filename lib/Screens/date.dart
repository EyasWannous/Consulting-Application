import 'dart:developer';

import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  State<StatefulWidget> createState() {
    return DateState();
  }
}

class DateState extends State<Date> {
  bool icn1 = false;
  bool x1 = false;
  bool x2 = true;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      Navigator.of(context).pushReplacementNamed("user homepage");
    } else {
      log(" notdone");
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int color1 = 0xff531470;
    int color2 = 0xffFAEAFF;
    int color3 = 0xffB9A4D8;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Text(
          "Sign up",
          style: TextStyle(color: Color(color2)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("back to login");
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            size: 30,
          ),
          color: Color(color3),
        ),
      ),
      body: Container(
        color: Color(color2),
        height: height,
        width: width,
      ),
    );
  }
}
