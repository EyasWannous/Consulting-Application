import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/postfunctions.dart';
import '../my_container.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  bool icn1 = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int color1 = 0xff531470;
    int color2 = 0xffFAEAFF;
    int color3 = 0xffB9A4D8;
    int color4 = 0xff00C9A6;
    return Scaffold(
      body: Container(
        height: height,
        color: Color(color2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyContainer(
                h: 0.35 * height,
                w: width,
                c: Container(
                  color: Color(color1),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.13 * width, vertical: 0.05 * height),
                child: MyContainer(
                  w: width,
                  h: 0.10 * height,
                  c: Text(
                    "2".tr,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: Color(color1)),
                  ),
                ),
              ),
              MyContainer(
                h: height * 0.25,
                w: width,
                c: Form(
                  key: formstate,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              return (text != null && text.contains('@'))
                                  ? null
                                  : "5".tr;
                            },
                            cursorColor: Color(color1),
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: Color(color1)),
                              hintText: "3".tr,
                              hintStyle: TextStyle(color: Color(color1)),
                              filled: true,
                              fillColor: Color(color3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(color1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            controller: passcontroller,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: icn1,
                            cursorColor: Color(color1),
                            validator: (text) {
                              if (text!.length < 4) {
                                return "6".tr;
                              } else {
                                return null;
                              }
                            },
                            maxLength: 8,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: Color(color1)),
                              hintText: "4".tr,
                              hintStyle: TextStyle(color: Color(color1)),
                              filled: true,
                              fillColor: Color(color3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  icn1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(color1),
                                ),
                                onPressed: () {
                                  setState(() {
                                    icn1 = !icn1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.01 * width, vertical: 0.01 * height),
                child: MyContainer(
                  h: 0.05 * height,
                  w: 0.20 * width,
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
                    onPressed: () async {
                      if (formstate.currentState!.validate()) {
                        setState(() {
                          postlogin(emailcontroller.text, passcontroller.text,
                              context);
                        });
                      }
                    },
                    child: Text("1".tr),
                  ),
                ),
              ),
              MyContainer(
                h: height * 0.08,
                w: width,
                c: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 30),
                      child: Text(
                        "7".tr,
                        style: TextStyle(color: Color(color1), fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Color(color4)),
                          ),
                          child: Text(
                            "8".tr,
                            style: const TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('sign up');
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
