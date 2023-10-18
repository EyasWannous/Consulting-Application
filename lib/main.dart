import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinic_app/Locale/local.dart';
import 'package:clinic_app/Screens/user_history.dart';
import 'package:clinic_app/Screens/user_pending.dart';
import 'Screens/book.dart';
import 'Screens/expert_homepage.dart';
import 'Screens/expert_profile.dart';
import 'Screens/fav_list.dart';
import 'Screens/search.dart';
import 'Screens/search_exp.dart';
import 'Screens/sign_up.dart';
import 'Screens/user_book.dart';
import 'Screens/user_homepage.dart';
import 'Screens/login.dart';
import 'Screens/add.dart';
import 'Screens/expert_signup.dart';
import 'Screens/experts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      locale: Get.deviceLocale,
      translations: MyLocale(),
      routes: {
        "sign up": (context) => const SignUp(),
        "back to login": (context) => const Login(),
        "go to be expert": (context) => const ExpertSign(),
        "back to be user": (context) => const SignUp(),
        "user homepage": (context) => const UserHomePage(),
        "search": (context) => const Search(),
        "search exp": (context) => const SearchExp(),
        "experts": (context) => const Experts(),
        "fav": (context) => const FavList(),
        "book": (context) => const UserBook(),
        "expert_pro": (context) => const ExpertProfile(),
        "add": (context) => const Add(),
        "expert homepage": (context) => const ExpertHomePage(),
        "book now": (context) => const Book(),
        "user pending": (context) => const UserPending(),
        "user history": (context) => const UserHistory(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}
