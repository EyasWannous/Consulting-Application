import 'package:flutter/material.dart';
import '../controller/getfunctions.dart';
import '../models/favexpertslist_model.dart';

class FavList extends StatefulWidget {
  const FavList({super.key});

  @override
  State<StatefulWidget> createState() {
    return FavListState();
  }
}

class FavListState extends State<FavList> {
  int color1 = 0xff531470;
  int color2 = 0xffFAEAFF;
  int color3 = 0xffB9A4D8;
  int color4 = 0xff00C9A6;

  late Future<List<FavExpertsToShow>> favexperts;

  @override
  void initState() {
    super.initState();
    favexperts = getfavexperts();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(color1),
          title: Text(
            "Favorite list",
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
          )),
      body: Container(
        color: Color(color2),
        width: width,
        height: height,
        child: FutureBuilder<List<FavExpertsToShow>>(
            future: favexperts,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('book',
                            arguments: {
                              'id': int.parse(
                                  (snapshot.data![index].expertId).toString())
                            });
                      },
                      child: Card(
                        color: Color(color3),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 27,
                            backgroundImage:
                                const AssetImage('assets/images/pro.png'),
                            backgroundColor: Color(color2),
                            //   backgroundImage: ,
                          ),
                          // subtitle: Text(
                          //   "Consulting Type",
                          //   style: TextStyle(
                          //       color: Color(color4),
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.w800),
                          // ),
                          title: Text(
                            snapshot.data![index].name.toString(),
                            style: TextStyle(
                                color: Color(color1),
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
