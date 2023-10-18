import 'package:flutter/material.dart';
import 'package:clinic_app/controller/getfunctions.dart';
import '../my_card.dart';
import '../mydrawer.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserHomePageState();
  }
}

int? balance;

class UserHomePageState extends State<UserHomePage> {
  bool icn1 = false;
  bool there = false;

  @override
  void initState() {
    super.initState();
    getbalance();
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
      endDrawer: MyDrawer(
        wallet: balance.toString(),
      ),
      //Drawer(
      //   backgroundColor: Color(color2),
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(25),
      //         child: Text(
      //           "MENU :",
      //           style: TextStyle(
      //               fontSize: 50,
      //               color: Color(color4),
      //               fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       Text(
      //         "-----------------------",
      //         style: TextStyle(
      //             fontSize: 50,
      //             color: Color(color4),
      //             fontWeight: FontWeight.w200),
      //       ),
      //       ListTile(
      //         trailing: IconButton(
      //           icon: Icon(
      //             Icons.person,
      //             color: Color(color1),
      //             size: 42,
      //           ),
      //           onPressed: () {},
      //         ),
      //         title: Text(
      //           "Profile",
      //           style: TextStyle(color: Color(color1), fontSize: 30),
      //         ),
      //       ),
      //       Text(
      //         "-----------------------",
      //         style: TextStyle(
      //             fontSize: 50,
      //             color: Color(color4),
      //             fontWeight: FontWeight.w200),
      //       ),
      //       ListTile(
      //         onTap: () {
      //           Navigator.of(context).pushNamed("fav");
      //         },
      //         trailing: Icon(
      //           Icons.favorite,
      //           color: Color(color1),
      //           size: 35,
      //         ),
      //         title: Text(
      //           "Favorite list",
      //           style: TextStyle(color: Color(color1), fontSize: 30),
      //         ),
      //       ),
      //       Text(
      //         "-----------------------",
      //         style: TextStyle(
      //             fontSize: 50,
      //             color: Color(color4),
      //             fontWeight: FontWeight.w200),
      //       ),
      //       ListTile(
      //         trailing: IconButton(
      //           icon: Icon(
      //             Icons.settings,
      //             color: Color(color1),
      //             size: 42,
      //           ),
      //           onPressed: () {},
      //         ),
      //         title: Text(
      //           "Settings",
      //           style: TextStyle(color: Color(color1), fontSize: 30),
      //         ),
      //       ),
      //       Text(
      //         "-----------------------",
      //         style: TextStyle(
      //             fontSize: 50,
      //             color: Color(color4),
      //             fontWeight: FontWeight.w200),
      //       ),
      //       ListTile(
      //         trailing: Icon(
      //           Icons.wallet,
      //           color: Color(color1),
      //           size: 42,
      //         ),
      //         subtitle: Text(
      //           "3333",
      //           style: TextStyle(color: Color(color4), fontSize: 30),
      //         ),
      //         title: Text(
      //           "Wallet",
      //           style: TextStyle(color: Color(color1), fontSize: 30),
      //         ),
      //       ),
      //       Text(
      //         "-----------------------",
      //         style: TextStyle(
      //             fontSize: 50,
      //             color: Color(color4),
      //             fontWeight: FontWeight.w200),
      //       ),
      //       ListTile(
      //         onTap: () {
      //           Navigator.of(context).pushNamed("back to login");
      //         },
      //         trailing: Icon(
      //           Icons.logout_outlined,
      //           color: Color(color1),
      //           size: 42,
      //         ),
      //         title: Text(
      //           "Log out",
      //           style: TextStyle(color: Color(color1), fontSize: 30),
      //         ),
      //       ),
      //       Text(
      //         "-----------------------",
      //         style: TextStyle(
      //             fontSize: 50,
      //             color: Color(color4),
      //             fontWeight: FontWeight.w200),
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Text(
          "Homepage",
          style: TextStyle(color: Color(color2)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("search");
          },
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
          color: Color(color3),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        color: Color(color2),
        width: width,
        height: height,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            childAspectRatio: 4 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 40,
          ),
          children: [
            Text(
              "LET'S CHOOSE A CONSULTATION:  ",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: Color(color1)),
            ),
            MyCard(
              c1: Color(color4),
              c2: Color(color1),
              ic1: Icons.medical_services,
              t: 'Medical consulting',
              id: 1,
            ),
            MyCard(
              c1: Color(color4),
              c2: Color(color1),
              ic1: Icons.family_restroom,
              t: 'Family consulting',
              id: 2,
            ),
            MyCard(
              c1: Color(color4),
              c2: Color(color1),
              ic1: Icons.work,
              t: 'Financial consulting',
              id: 3,
            ),
            MyCard(
              c1: Color(color4),
              c2: Color(color1),
              ic1: Icons.hearing,
              t: 'Psychological consulting',
              id: 4,
            ),
            MyCard(
              c1: Color(color4),
              c2: Color(color1),
              ic1: Icons.text_snippet,
              t: 'Business consulting',
              id: 5,
            ),
          ],
        ),
      ),
    );
  }
}
