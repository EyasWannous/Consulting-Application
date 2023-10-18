import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/postfunctions.dart';
import '../my_container.dart';

class ExpertSign extends StatefulWidget {
  const ExpertSign({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExpertSignState();
  }
}

class ExpertSignState extends State<ExpertSign> {
  var addresscontroller = TextEditingController();
  var experiencecontroller = TextEditingController();

  int color1 = 0xff531470;
  int color2 = 0xffFAEAFF;
  int color3 = 0xffB9A4D8;
  int color4 = 0xff00C9A6;
  bool there = false;
  //File? img;
  File? image;

  final picker = ImagePicker();

  Future getOneImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        log('No image selected.');
      }
    });
  }

  bool icn1 = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Text(
          "Becoming an expert",
          style: TextStyle(color: Color(color2)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("back to be user");
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(9),
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Container(
                      margin: const EdgeInsets.only(left: 9),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.black12, shape: BoxShape.circle),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(80),
                          child: image == null
                              ? const Text('')
                              : Image.file(
                                  image!,
                                  fit: BoxFit.scaleDown,
                                ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: getOneImage,
                        icon: Icon(Icons.add_a_photo, color: Color(color1)))
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.20 * width, vertical: 0.01 * height),
                child: MyContainer(
                  c: Text(
                    "+ Add profile photo",
                    style: TextStyle(
                        color: Color(color1),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  w: 0.33 * width,
                  h: 0.05 * height,
                ),
              ),
              MyContainer(
                h: height * 0.45,
                w: width,
                c: Form(
                  key: formstate,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: addresscontroller,
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
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: experiencecontroller,
                          cursorColor: Color(color1),
                          validator: (text) {
                            return (text != null)
                                ? null
                                : "you have to enter text";
                          },
                          keyboardType: TextInputType.name,
                          maxLines: 6,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(30),
                            counterStyle: TextStyle(color: Color(color1)),
                            hintText: "CV:",
                            hintStyle: TextStyle(color: Color(color1)),
                            filled: true,
                            fillColor: Color(color3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.text_snippet,
                              color: Color(color1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.10 * width, vertical: 0.01 * height),
                child: MyContainer(
                  h: 0.05 * height,
                  w: 0.50 * width,
                  c: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                        elevation: MaterialStateProperty.all(8),
                        shadowColor: MaterialStateProperty.all(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all(Color(color1)),
                        foregroundColor:
                            MaterialStateProperty.all(Color(color3))),
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        setState(() {
                          postexpertsignup(
                              args['name'].toString(),
                              args['email'].toString(),
                              args['password'].toString(),
                              int.parse(args['phone'].toString()),
                              1,
                              int.parse(args['wallet'].toString()),
                              addresscontroller.text,
                              experiencecontroller.text,
                              context);
                          // postexpertsignupwithimage(
                          //     args['name'].toString(),
                          //     args['email'].toString(),
                          //     args['password'].toString(),
                          //     int.parse(args['phone'].toString()),
                          //     1,
                          //     int.parse(args['wallet'].toString()),
                          //     addresscontroller.text,
                          //     experiencecontroller.text,
                          //     image!,
                          //     context);
                        });
                      }
                    },
                    child: const Text(
                      "Sign up as an expert ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
