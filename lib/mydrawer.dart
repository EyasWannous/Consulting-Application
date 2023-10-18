import 'package:flutter/material.dart';

import 'controller/getfunctions.dart';

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  String? wallet;

  MyDrawer({super.key, this.wallet});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int color1 = 0xff531470;

  int color2 = 0xffFAEAFF;

  int color3 = 0xffB9A4D8;

  int color4 = 0xff00C9A6;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(color2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                "MENU :",
                style: TextStyle(
                    fontSize: 50,
                    color: Color(color4),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "-----------------------",
              style: TextStyle(
                  fontSize: 50,
                  color: Color(color4),
                  fontWeight: FontWeight.w200),
            ),
            ListTile(
              trailing: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Color(color1),
                  size: 42,
                ),
                onPressed: () {},
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Color(color1), fontSize: 30),
              ),
            ),
            Text(
              "-----------------------",
              style: TextStyle(
                  fontSize: 50,
                  color: Color(color4),
                  fontWeight: FontWeight.w200),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("fav");
              },
              trailing: Icon(
                Icons.favorite,
                color: Color(color1),
                size: 35,
              ),
              title: Text(
                "Favorite list",
                style: TextStyle(color: Color(color1), fontSize: 30),
              ),
            ),
            Text(
              "-----------------------",
              style: TextStyle(
                  fontSize: 50,
                  color: Color(color4),
                  fontWeight: FontWeight.w200),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed('user pending'),
              trailing: IconButton(
                icon: Icon(
                  Icons.pending,
                  color: Color(color1),
                  size: 42,
                ),
                onPressed: () {},
              ),
              title: Text(
                "Pending Consults",
                style: TextStyle(color: Color(color1), fontSize: 30),
              ),
            ),
            Text(
              "-----------------------",
              style: TextStyle(
                  fontSize: 50,
                  color: Color(color4),
                  fontWeight: FontWeight.w200),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed('user history'),
              trailing: IconButton(
                icon: Icon(
                  Icons.history,
                  color: Color(color1),
                  size: 42,
                ),
                onPressed: () {},
              ),
              title: Text(
                "Consults History",
                style: TextStyle(color: Color(color1), fontSize: 30),
              ),
            ),
            Text(
              "-----------------------",
              style: TextStyle(
                  fontSize: 50,
                  color: Color(color4),
                  fontWeight: FontWeight.w200),
            ),
            ListTile(
              trailing: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Color(color1),
                  size: 42,
                ),
                onPressed: () {},
              ),
              title: Text(
                "Settings",
                style: TextStyle(color: Color(color1), fontSize: 30),
              ),
            ),
            Text(
              "-----------------------",
              style: TextStyle(
                  fontSize: 50,
                  color: Color(color4),
                  fontWeight: FontWeight.w200),
            ),
            ListTile(
              trailing: Icon(
                Icons.wallet,
                color: Color(color1),
                size: 42,
              ),
              subtitle: Text(
                widget.wallet!,
                style: TextStyle(color: Color(color4), fontSize: 30),
              ),
              title: Text(
                "Wallet",
                style: TextStyle(color: Color(color1), fontSize: 30),
              ),
            ),
            Text(
              "-----------------------",
              style: TextStyle(
                  fontSize: 50,
                  color: Color(color4),
                  fontWeight: FontWeight.w200),
            ),
            ListTile(
              onTap: () {
                getlogout(context);
              },
              trailing: Icon(
                Icons.logout_outlined,
                color: Color(color1),
                size: 42,
              ),
              title: Text(
                "Log out",
                style: TextStyle(color: Color(color1), fontSize: 30),
              ),
            ),
            Text(
              "-----------------------",
              style: TextStyle(
                  fontSize: 50,
                  color: Color(color4),
                  fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}
