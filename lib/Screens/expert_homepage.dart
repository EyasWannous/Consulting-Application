import 'package:flutter/material.dart';
import '/Screens/expert_profile.dart';
import '/Screens/history.dart';
import '/Screens/pending.dart';

class ExpertHomePage extends StatefulWidget {
  const ExpertHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExpertHomePageState();
  }
}

class ExpertHomePageState extends State<ExpertHomePage> {
  bool icn1 = false;
  bool there = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int color1 = 0xff531470;
    int color2 = 0xffFAEAFF;
    int color4 = 0xff00C9A6;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: Color(color2),
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
                  "3333",
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
                  Navigator.of(context).pushNamed("back to login");
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
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Profile",
              ),
              Tab(
                text: "History",
              )
            ],
          ),
          backgroundColor: Color(color1),
          title: Text(
            "Homepage",
            style: TextStyle(color: Color(color2)),
          ),
        ),
        body: Container(
          color: Color(color2),
          width: width,
          height: height,
          child: const TabBarView(
            children: [
              Pending(),
              ExpertProfile(),
              History(),
            ],
          ),
        ),
      ),
    );
  }
}
