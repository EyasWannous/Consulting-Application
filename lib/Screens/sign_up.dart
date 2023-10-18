import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../controller/postfunctions.dart';
import '../my_container.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var walletcontroller = TextEditingController();

  bool isexpert = false;

  bool icn1 = false;
  bool x1 = false;
  bool x2 = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int color1 = 0xff531470;
    int color2 = 0xffFAEAFF;
    int color3 = 0xffB9A4D8;
    int color4 = 0xff00C9A6;
    InputDecoration inputDecoration(String s, IconData ic) {
      return InputDecoration(
        counterStyle: TextStyle(color: Color(color1)),
        hintText: s,
        hintStyle: TextStyle(color: Color(color1)),
        filled: true,
        fillColor: Color(color3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          ic,
          color: Color(color1),
        ),
      );
    }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.13 * width, vertical: 0.05 * height),
                child: MyContainer(
                  c: Text(
                    "9".tr,
                    style: TextStyle(color: Color(color1), fontSize: 30),
                  ),
                  w: width,
                  h: 0.05 * height,
                ),
              ),
              MyContainer(
                h: height * 0.5,
                w: width,
                c: Form(
                  key: formstate,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                              controller: namecontroller,
                              cursorColor: Color(color1),
                              validator: (text) {
                                return (text != null && text.length > 3)
                                    ? null
                                    : "10".tr;
                              },
                              keyboardType: TextInputType.text,
                              decoration:
                                  inputDecoration("11".tr, Icons.person)),
                        ),
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
                            decoration: inputDecoration('3'.tr, Icons.email),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            controller: passcontroller,
                            cursorColor: Color(color1),
                            validator: (text) {
                              if (text!.length < 4) {
                                return "10".tr;
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: icn1,
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
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                              controller: walletcontroller,
                              cursorColor: Color(color1),
                              validator: (text) {
                                if (text!.length < 2) {
                                  return "you have to enter money";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              obscureText: icn1,
                              decoration:
                                  inputDecoration("12".tr, Icons.wallet)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: IntlPhoneField(
                            controller: phonecontroller,
                            cursorColor: Color(color1),
                            initialCountryCode: 'SY',
                            keyboardType: TextInputType.phone,
                            decoration: inputDecoration("13".tr, Icons.phone),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.01 * width, vertical: 0.02 * height),
                child: MyContainer(
                  h: 0.07 * height,
                  w: 0.40 * width,
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
                        setState(
                          () {
                            postusersignup(
                                namecontroller.text,
                                emailcontroller.text,
                                passcontroller.text,
                                int.parse(phonecontroller.text),
                                isexpert == true ? 1 : 0,
                                int.parse(walletcontroller.text),
                                context);
                          },
                        );
                      }
                    },
                    child: Text(
                      "14".tr,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ),
              MyContainer(
                h: height * 0.10,
                w: width,
                c: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 30),
                      child: Text(
                        "15".tr,
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
                          "16".tr,
                          style: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (formstate.currentState!.validate()) {
                            isexpert = true;
                            Navigator.of(context)
                                .pushNamed("go to be expert", arguments: {
                              'name': namecontroller.text,
                              'email': emailcontroller.text,
                              'password': passcontroller.text,
                              'phone': int.parse(phonecontroller.text),
                              'wallet': int.parse(walletcontroller.text)
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
