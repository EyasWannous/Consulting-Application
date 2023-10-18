import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:clinic_app/Screens/experts.dart';
import 'package:clinic_app/controller/getfunctions.dart';
import '../controller/postfunctions.dart';
import '../models/myprofile_model.dart';
import '../my_container.dart';

class ExpertProfile extends StatefulWidget {
  const ExpertProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExpertProfileState();
  }
}

class ExpertProfileState extends State<ExpertProfile> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  var daycontroller = TextEditingController();
  var fromcontroller = TextEditingController();
  var tocontroller = TextEditingController();
  int color1 = 0xff531470;
  int color2 = 0xffFAEAFF;
  int color3 = 0xffB9A4D8;
  int color4 = 0xff00C9A6;

  @override
  initState() {
    super.initState();
  }

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
    return Scaffold(
      body: Container(
        color: Color(color2),
        height: height,
        width: width,
        child: FutureBuilder<MyProfileToShow>(
          future: getmyprofile(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: MyContainer(
                        h: height * 0.20,
                        w: width * 0.40,
                        c: CircleAvatar(
                          radius: 70,
                          // foregroundImage: image,
                          backgroundImage:
                              NetworkImage('$imurl${snapshot.data!.imagePath}'),
                          backgroundColor: Color(color3),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: Text(
                        (snapshot.data?.name).toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: Text(
                        (snapshot.data?.email).toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: TextFormField(
                        initialValue: snapshot.data?.address.toString(),
                        cursorColor: Color(color1),
                        validator: (text) {
                          return (text != null)
                              ? null
                              : "you have to enter text";
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(color1)),
                          hintText: "Address",
                          hintStyle: TextStyle(color: Color(color1)),
                          filled: true,
                          fillColor: Color(color3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.home_rounded,
                            color: Color(color1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: TextFormField(
                        initialValue: snapshot.data?.phoneNumber.toString(),
                        cursorColor: Color(color1),
                        validator: (text) {
                          return (text != null)
                              ? null
                              : "you have to enter text";
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(color1)),
                          hintText: "Number",
                          hintStyle: TextStyle(color: Color(color1)),
                          filled: true,
                          fillColor: Color(color3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.home_rounded,
                            color: Color(color1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: TextFormField(
                        initialValue: snapshot.data?.experience.toString(),
                        cursorColor: Color(color1),
                        validator: (text) {
                          return (text != null)
                              ? null
                              : "you have to enter text";
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(color1)),
                          hintText: "Services",
                          hintStyle: TextStyle(color: Color(color1)),
                          filled: true,
                          fillColor: Color(color3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.home_rounded,
                            color: Color(color1),
                          ),
                        ),
                      ),
                    ),
                    //SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 250, left: 20),
                      child: TextFormField(
                        controller: daycontroller,
                        cursorColor: Color(color1),
                        validator: (text) {
                          return (text != null)
                              ? null
                              : "you have to enter text";
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(color1)),
                          hintText: "Day",
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 250, left: 20),
                      child: TextFormField(
                        controller: fromcontroller,
                        cursorColor: Color(color1),
                        validator: (text) {
                          return (text != null)
                              ? null
                              : "you have to enter text";
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(color1)),
                          hintText: "From",
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 250, left: 20),
                      child: TextFormField(
                        controller: tocontroller,
                        cursorColor: Color(color1),
                        validator: (text) {
                          return (text != null)
                              ? null
                              : "you have to enter text";
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(color1)),
                          hintText: "TO",
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
                    Padding(
                      padding: const EdgeInsets.all(0.005),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                            elevation: MaterialStateProperty.all(8),
                            shadowColor:
                                MaterialStateProperty.all(Colors.black),
                            backgroundColor:
                                MaterialStateProperty.all(Color(color1)),
                            foregroundColor:
                                MaterialStateProperty.all(Color(color2))),
                        onPressed: () {
                          postaddtime(daycontroller.text, fromcontroller.text,
                              tocontroller.text);
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                            elevation: MaterialStateProperty.all(8),
                            shadowColor:
                                MaterialStateProperty.all(Colors.black),
                            backgroundColor:
                                MaterialStateProperty.all(Color(color4)),
                            foregroundColor:
                                MaterialStateProperty.all(Color(color1))),
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pushNamed("add");
                          });
                        },
                        child: const Text(
                          "+Adding more services ",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
