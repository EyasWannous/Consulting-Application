import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clinic_app/controller/getfunctions.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<StatefulWidget> createState() {
    return BookState();
  }
}

int? idinbooknow;

class BookState extends State<Book> {
  String s = "Submit";
  String? start = "";
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  int startToShow = 0;
  int endToShow = 0;
  send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      Navigator.of(context).pushReplacementNamed("user homepage");
    } else {
      log(" notdone");
    }
  }

  String value = 'Choose a day';
  List<String> lst = [
    'Sunday',
    'Monday',
    'Tuseday',
    'Wednsday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  String? stringfromget;
  int color1 = 0xff531470;
  int color2 = 0xffFAEAFF;
  int color3 = 0xffB9A4D8;
  int color4 = 0xff00C9A6;
  DateTime? _seletedDate;
  void _datePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2024),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(color1), // <-- SEE HERE
                onPrimary: Color(color4), // <-- SEE HERE
                onSurface: Color(color1), // <-- SEE HERE
              ),
            ),
            child: child!,
          );
        }).then((value) {
      if (value == null) {
        return null;
      }
      setState(() {
        _seletedDate = value;
        gettimestobook(_seletedDate!, idinbooknow!);
        // savetimestoshow();
      });
    });
  }

  // savetimestoshow() async {
  //   SharedPreferences gettime = await SharedPreferences.getInstance();
  //   stringfromget = gettime.getString('time');
  //   int index;
  //   for (index = 0; index <= 0; index++) {
  //     if (stringfromget![index] == '1') {
  //       startToShow = index;
  //       break;
  //     }
  //   }
  //   for (index = 23; index >= 0; index--) {
  //     if (stringfromget![index] == '1') {
  //       endToShow = index;
  //       break;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Text(
          "Let's book",
          style: TextStyle(color: Color(color2)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("user homepage");
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 240,
                height: 90,
                color: Color(color3),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(3))),
                      elevation: MaterialStateProperty.all(8),
                      shadowColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Color(color3)),
                      foregroundColor:
                          MaterialStateProperty.all(Color(color1))),
                  onPressed: () {
                    setState(() {
                      _datePicker();
                      // print(DateFormat.yMd().format(_seletedDate!));
                    });
                  },
                  child: _seletedDate != null
                      ? Text(
                          "${DateFormat.yMd().format(_seletedDate!)} ",
                          style: TextStyle(color: Color(color1), fontSize: 30),
                        )
                      : Text(
                          'DatePicker',
                          style: TextStyle(color: Color(color1), fontSize: 30),
                        ),
                ),
                // child: Padding(
                //   padding: const EdgeInsets.all(15),
                //   child: DropdownButton(
                //     hint: Text(
                //       '$value',
                //       style: TextStyle(
                //           color: Color(color1),
                //           fontWeight: FontWeight.bold,
                //           fontSize: 30),
                //     ),
                //     onChanged: (v) {
                //       setState(() {
                //         value = v.toString();
                //       });
                //     },
                //     items: lst.map((element) {
                //       return DropdownMenuItem(
                //         child: Text('$element'),
                //         value: element,
                //       );
                //     }).toList(),
                //   ),
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 240,
                height: 90,
                color: Color(color3),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'start $startToShow',
                    style: TextStyle(
                        color: Color(color1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, right: 60, left: 60),
              child: TextFormField(
                cursorColor: Color(color1),
                validator: (text) {
                  return (text != null) ? null : "you have to enter text";
                },
                onSaved: (text) {
                  start = text;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counterStyle: TextStyle(color: Color(color1)),
                  hintText: "Enter you time",
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
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 240,
                height: 90,
                color: Color(color3),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'end $endToShow',
                    style: TextStyle(
                        color: Color(color1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
                    elevation: MaterialStateProperty.all(8),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor: MaterialStateProperty.all(Color(color4)),
                    foregroundColor: MaterialStateProperty.all(Color(color1))),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushNamed("add");
                  });
                },
                child: Text(
                  s,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
