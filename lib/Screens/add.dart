import 'dart:developer';

import 'package:consulting_application/controller/postfunctions.dart';

import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddState();
  }
}

class AddState extends State<Add> {
  var price1 = TextEditingController();
  var price2 = TextEditingController();
  var price3 = TextEditingController();
  var price4 = TextEditingController();
  var price5 = TextEditingController();

  String s = "Submit";

  bool medicalConsulting = false;
  bool familyConsulting = false;
  bool professionalConsulting = false;
  bool psychologicalConsulting = false;
  bool administrativeConsulting = false;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      log(" done");
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
    int color4 = 0xff00C9A6;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Text(
          "Add more services",
          style: TextStyle(color: Color(color2)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("expert homepage");
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
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CheckboxListTile(
                  checkColor: Color(color2),
                  activeColor: Color(color4),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 200, left: 15),
                    child: TextFormField(
                      controller: price1,
                      cursorColor: Color(color1),
                      validator: (text) {
                        return (text != null) ? null : "you have to enter text";
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Color(color1)),
                        hintText: "Cost",
                        hintStyle: TextStyle(color: Color(color1)),
                        filled: true,
                        fillColor: Color(color3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    " Medical consulting",
                    style: TextStyle(
                        color: Color(color1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  value: medicalConsulting,
                  onChanged: (value) {
                    setState(() {
                      medicalConsulting = value!;
                    });
                  }),
              Text(
                "------------------------------------",
                style: TextStyle(
                    color: Color(color4),
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
              CheckboxListTile(
                  checkColor: Color(color2),
                  activeColor: Color(color4),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 200, left: 15),
                    child: TextFormField(
                      controller: price2,
                      cursorColor: Color(color1),
                      validator: (text) {
                        return (text != null) ? null : "you have to enter text";
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Color(color1)),
                        hintText: "Cost",
                        hintStyle: TextStyle(color: Color(color1)),
                        filled: true,
                        fillColor: Color(color3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    " Family consulting",
                    style: TextStyle(
                        color: Color(color1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  value: familyConsulting,
                  onChanged: (value) {
                    setState(() {
                      familyConsulting = value!;
                    });
                  }),
              Text(
                "------------------------------------",
                style: TextStyle(
                    color: Color(color4),
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
              CheckboxListTile(
                  checkColor: Color(color2),
                  activeColor: Color(color4),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 200, left: 15),
                    child: TextFormField(
                      controller: price3,
                      cursorColor: Color(color1),
                      validator: (text) {
                        return (text != null) ? null : "you have to enter text";
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Color(color1)),
                        hintText: "Cost",
                        hintStyle: TextStyle(color: Color(color1)),
                        filled: true,
                        fillColor: Color(color3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    " Professional consulting",
                    style: TextStyle(
                        color: Color(color1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  value: professionalConsulting,
                  onChanged: (value) {
                    setState(() {
                      professionalConsulting = value!;
                    });
                  }),
              Text(
                "------------------------------------",
                style: TextStyle(
                    color: Color(color4),
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
              CheckboxListTile(
                  checkColor: Color(color2),
                  activeColor: Color(color4),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 200, left: 15),
                    child: TextFormField(
                      controller: price4,
                      cursorColor: Color(color1),
                      validator: (text) {
                        return (text != null) ? null : "you have to enter text";
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Color(color1)),
                        hintText: "Cost",
                        hintStyle: TextStyle(color: Color(color1)),
                        filled: true,
                        fillColor: Color(color3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    " Psychological consulting",
                    style: TextStyle(
                        color: Color(color1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  value: psychologicalConsulting,
                  onChanged: (value) {
                    setState(() {
                      psychologicalConsulting = value!;
                    });
                  }),
              Text(
                "------------------------------------",
                style: TextStyle(
                    color: Color(color4),
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
              CheckboxListTile(
                  checkColor: Color(color2),
                  activeColor: Color(color4),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 200, left: 15),
                    child: TextFormField(
                      controller: price5,
                      cursorColor: Color(color1),
                      validator: (text) {
                        return (text != null) ? null : "you have to enter text";
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Color(color1)),
                        hintText: "Cost",
                        hintStyle: TextStyle(color: Color(color1)),
                        filled: true,
                        fillColor: Color(color3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    " Administrative consulting",
                    style: TextStyle(
                        color: Color(color1),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  value: administrativeConsulting,
                  onChanged: (value) {
                    setState(() {
                      administrativeConsulting = value!;
                    });
                  }),
              Text(
                "------------------------------------",
                style: TextStyle(
                    color: Color(color4),
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(3))),
                      elevation: MaterialStateProperty.all(8),
                      shadowColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Color(color4)),
                      foregroundColor:
                          MaterialStateProperty.all(Color(color1))),
                  onPressed: () {
                    int p1, p2, p3, p4, p5;
                    if (medicalConsulting) {
                      p1 = int.parse(price1.text);
                    } else {
                      p1 = 0;
                    }
                    if (familyConsulting) {
                      p2 = int.parse(price2.text);
                    } else {
                      p2 = 0;
                    }
                    if (professionalConsulting) {
                      p3 = int.parse(price3.text);
                    } else {
                      p3 = 0;
                    }
                    if (psychologicalConsulting) {
                      p4 = int.parse(price4.text);
                    } else {
                      p4 = 0;
                    }
                    if (administrativeConsulting) {
                      p5 = int.parse(price5.text);
                    } else {
                      p5 = 0;
                    }
                    postaddmoreservices(p1, p2, p3, p4, p5);
                  },
                  child: Text(
                    s,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
