import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

int color1 = 0xff531470;
int color2 = 0xffFAEAFF;
int color3 = 0xffB9A4D8;
int color4 = 0xff00C9A6;

class SearchState extends State<Search> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = [
    'Medical consulting',
    'Family consulting',
    'Financial consulting',
    'Psychological consulting',
    'Business consulting',
  ];
  var items = [
    'Medical consulting',
    'Family consulting',
    'Financial consulting',
    'Psychological consulting',
    'Business consulting',
  ];

  // @override
  // void initState() async {
  //   items.addAll(duplicateItems);
  //   super.initState();
  // }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      for (var item in dummySearchList) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Text(
          "Search",
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
        ),
      ),
      body: Container(
        color: Color(color2),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                cursorColor: Color(color1),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Color(color1)),
                  filled: true,
                  fillColor: Color(color3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(color1),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      if (items[index] == 'Medical consulting') {
                        Navigator.of(context).pushReplacementNamed('experts',
                            arguments: {'id': 1});
                      } else if (items[index] == 'Family consulting') {
                        Navigator.of(context).pushReplacementNamed('experts',
                            arguments: {'id': 2});
                      } else if (items[index] == 'Financial consulting') {
                        Navigator.of(context).pushReplacementNamed('experts',
                            arguments: {'id': 3});
                      } else if (items[index] == 'Psychological consulting') {
                        Navigator.of(context).pushReplacementNamed('experts',
                            arguments: {'id': 4});
                      } else {
                        Navigator.of(context).pushReplacementNamed('experts',
                            arguments: {'id': 5});
                      }
                    },
                    title: Text(items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
