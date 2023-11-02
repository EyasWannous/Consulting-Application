import 'package:flutter/material.dart';
import 'package:consulting_application/Screens/book.dart';
import 'package:consulting_application/Screens/experts.dart';
import 'package:consulting_application/models/expertprofilebyid_model.dart';
import '../controller/getfunctions.dart';
import '../my_container.dart';

class UserBook extends StatefulWidget {
  const UserBook({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserBookState();
  }
}

int? idinbook;

class UserBookState extends State<UserBook> {
  int num = 1;
  int color1 = 0xff531470;
  int color2 = 0xffFAEAFF;
  int color3 = 0xffB9A4D8;
  int color4 = 0xff00C9A6;
  bool isfavorite = false;

  // late DateTime _seletedDate;
  // void _datePicker() {
  //   showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2020),
  //       lastDate: DateTime(2024),
  //       builder: (context, child) {
  //         return Theme(
  //           data: Theme.of(context).copyWith(
  //               colorScheme: ColorScheme.light(
  //             primary: Color(color1), // <-- SEE HERE
  //             onPrimary: Color(color4), // <-- SEE HERE
  //             onSurface: Color(color1), // <-- SEE HERE
  //           )),
  //           child: child!,
  //         );
  //       }).then((value) {
  //     if (value == null) {
  //       return null;
  //     }
  //     setState(() {
  //       _seletedDate = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Text(
          " Expert",
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
      body: FutureBuilder<ExpertProfileFormUser>(
        future: getexpertprofilebyid(int.parse(args['id'].toString())),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Container(
                color: Color(color2),
                width: width,
                height: height,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 300),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isfavorite = !isfavorite;
                              });
                            },
                            icon: Icon(
                              (snapshot.data?.isFavourite)!
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isfavorite == true
                                  ? Colors.red
                                  : Color(color1),
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      padding: const EdgeInsets.only(left: 115),
                      child: Row(
                        children: [
                          Text(
                            "Name :  ${(snapshot.data?.name).toString()}",
                            style:
                                TextStyle(color: Color(color1), fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 115),
                      child: Row(
                        children: [
                          Text(
                            "Address :  ${(snapshot.data?.address).toString()}",
                            style:
                                TextStyle(color: Color(color1), fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 115),
                      child: Row(
                        children: [
                          Text(
                            "email :  ${(snapshot.data?.email).toString()}",
                            style:
                                TextStyle(color: Color(color1), fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 115),
                      child: Row(
                        children: [
                          Text(
                            "phone :  ${(snapshot.data?.phoneNumber).toString()}",
                            style:
                                TextStyle(color: Color(color1), fontSize: 30),
                          ),
                        ],
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 95, right: 55),
                    //   child: Row(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.all(8),
                    //         child: IconButton(
                    //           onPressed: () {},
                    //           icon: Icon(
                    //             Icons.call,
                    //             color: Color(color1),
                    //             size: 30,
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.all(8),
                    //         child: IconButton(
                    //           onPressed: () {},
                    //           icon: Icon(
                    //             Icons.video_call,
                    //             color: Color(color1),
                    //             size: 35,
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.all(8),
                    //         child: IconButton(
                    //             onPressed: () {},
                    //             icon: Icon(Icons.chat,
                    //                 color: Color(color1), size: 27)),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        color: Color(color3),
                        width: 350,
                        height: 200,
                        child: Text(
                          (snapshot.data?.experience).toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 115),
                      child: Row(
                        children: [
                          Column(children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 300),
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 60,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 300),
                              child: Text(
                                (snapshot.data?.rating).toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          elevation: MaterialStateProperty.all(8),
                          shadowColor: MaterialStateProperty.all(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all(Color(color4)),
                          foregroundColor:
                              MaterialStateProperty.all(Color(color1))),
                      onPressed: () {
                        // setState(() {
                        idinbooknow = args['id'] as int?;
                        Navigator.of(context).pushNamed("book now");
                        // });
                      },
                      child: const Text(
                        "Book now",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
