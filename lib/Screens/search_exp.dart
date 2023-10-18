import 'package:flutter/material.dart';
import 'package:clinic_app/Screens/experts.dart';
import 'package:clinic_app/models/expertsearch_model.dart';

class SearchExp extends StatefulWidget {
  const SearchExp({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchExpState();
  }
}

int? idinsearch;

class SearchExpState extends State<SearchExp> {
  TextEditingController editingController = TextEditingController();
  int color1 = 0xff531470;
  int color2 = 0xffFAEAFF;
  int color3 = 0xffB9A4D8;
  int color4 = 0xff00C9A6;

  // var duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  // fSToS() async {
  //   // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // duplicateItems = prefs.getStringList('stringList') ?? <String>[];
  //   //   return duplicateItems;
  //   // duplicateItems = await getexpertsincatforsearch(1);
  // }

  var items = <ExpertSearch>[];

  @override
  void initState() {
    items.addAll(forS);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<ExpertSearch> dummySearchList = <ExpertSearch>[];
    dummySearchList.addAll(forS);
    if (query.isNotEmpty) {
      List<ExpertSearch> dummyListData = <ExpertSearch>[];
      for (var item in dummySearchList) {
        if (item.name!.toLowerCase().contains(query.toLowerCase())) {
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
        items.addAll(forS);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Text(
          "Search",
          style: TextStyle(color: Color(color2)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("experts",
                arguments: {'id': int.parse(idinsearch.toString())});
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
                      Navigator.of(context).pushReplacementNamed('book',
                          arguments: {
                            'id': int.parse(items[index].id.toString())
                          });
                    },
                    title: Text(items[index].name!),
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
