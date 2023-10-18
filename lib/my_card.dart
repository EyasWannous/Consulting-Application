import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCard extends StatelessWidget {
  int color1 = 0xff531470;
  int color2 = 0xffFAEAFF;
  int color3 = 0xffB9A4D8;
  int color4 = 0xff00C9A6;
  MyCard({
    super.key,
    required this.c1,
    required this.t,
    required this.c2,
    required this.ic1,
    required this.id,
  });

  late String t;
  late Color c1;
  late Color c2;
  late IconData ic1;
  late int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          width: 200,
          height: 400,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [c1, c2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Text(
                t,
                style: TextStyle(
                    color: Color(color2),
                    fontSize: 29,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(ic1, color: Color(color3), size: 62),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed("experts", arguments: {'id': id});
        });
  }
}
