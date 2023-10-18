import 'package:flutter/material.dart';
import 'package:clinic_app/Screens/search_exp.dart';
import 'package:clinic_app/Screens/user_book.dart';
import 'package:clinic_app/models/expertsearch_model.dart';
import '../controller/getfunctions.dart';
import '../models/expertlist_model.dart';

String imurl = 'http://127.0.0.1/consultor/storage/app/public/images/users/';

class Experts extends StatefulWidget {
  const Experts({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExpertsState();
  }
}

// ignore: prefer_typing_uninitialized_variables
List<ExpertSearch> forS = [];
// var duplicateItemsforexperts;

class ExpertsState extends State<Experts> {
  // late Future<List<ServicesByCatId>> expInCat;

  @override
  void initState() {
    super.initState();
    // expInCat =
  }

  int color1 = 0xff531470;
  int color2 = 0xffFAEAFF;
  int color3 = 0xffB9A4D8;
  int color4 = 0xff00C9A6;

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Row(
          children: [
            Expanded(
              flex: 1,
              // child: TextField(
              //   decoration: const InputDecoration(
              //     hintText: 'Search',
              //   ),
              //   onChanged: (value) {
              //     setState(() {
              //       // Update the search term
              //       _searchTerm = value;
              //     });
              //   },
              // ),
              child: Text(
                "Experts list",
                style: TextStyle(color: Color(color2)),
              ),
            ),
            IconButton(
              onPressed: () async {
                forS = await getexpertsincatforsearch(
                    int.parse(args['id'].toString()));
                // for (var item in forS) {
                //   duplicateItemsforexperts.add(item.name.toString());
                // }
                idinsearch = args['id'] as int?;
                Navigator.of(context)
                    .pushNamed("search exp", arguments: {'id': args['id']});
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
              color: Color(color3),
            ),
          ],
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
      body: Container(
        color: Color(color2),
        width: width,
        height: height,
        child: FutureBuilder<List<ServicesByCatId>>(
          future: getexpertsincat(int.parse(args['id'].toString())),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Color(color3),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage(
                            '$imurl${snapshot.data![index].imagePath}'),
                        backgroundColor: Color(color2),
                      ),
                      subtitle: Text(
                        snapshot.data![index].categoryName.toString(),
                        style: TextStyle(
                            color: Color(color4),
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                      title: Text(
                        snapshot.data![index].userName.toString(),
                        style: TextStyle(
                            color: Color(color1),
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          idinbook = args['id'] as int?;
                          Navigator.of(context).pushNamed("book", arguments: {
                            'id': int.parse(
                                snapshot.data![index].expertId.toString())
                          });
                        },
                        icon: const Icon(
                          Icons.navigate_next_sharp,
                          size: 35,
                        ),
                        color: Color(color1),
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
