import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../controller/getfunctions.dart';
import '../models/consultsfromuser_model.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserHistoryState();
  }
}

class UserHistoryState extends State<UserHistory> {
  int color1 = 0xff531470;
  int color2 = 0xffFAEAFF;
  int color3 = 0xffB9A4D8;
  int color4 = 0xff00C9A6;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          // style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Color(color1),
      ),
      body: Container(
        color: Color(color2),
        width: width,
        height: height,
        child: FutureBuilder<List<ConsultsToShow>>(
          future: gethistoryconsults(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Color(color3),
                    child: ListTile(
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Stack(
                              // overflow: Overflow.visible,
                              children: <Widget>[
                                Positioned(
                                  child: RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      leading: Text(
                        snapshot.data![index].rating.toString(),
                        style: TextStyle(color: Color(color1), fontSize: 35),
                      ),
                      subtitle: Text(
                        (snapshot.data![index].catergoryName).toString(),
                        style: TextStyle(
                            color: Color(color4),
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                      title: Text(
                        (snapshot.data![index].name).toString(),
                        style: TextStyle(
                            color: Color(color1),
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
